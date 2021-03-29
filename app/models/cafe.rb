class Cafe < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_many :cafe_categories
  has_many :categories, through: :cafe_categories

  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true

  validates :name, uniqueness: {scope: [:city, :state], message: "already exists for this city and state" }

  validates :open_hour, presence: true
  validates :open_minute, presence: true
  validates :close_hour, presence: true
  validates :close_minute, presence: true

  accepts_nested_attributes_for :categories

  scope :filter_by_state, -> (params) { where("state = ?", params) }


  def self.highly_rated
    @cafe = Cafe.joins('INNER JOIN reviews ON cafes.id = reviews.cafe_id').group('cafes.id').order('AVG(reviews.rating) DESC').limit(1)[0]
  end

  def self.search(params)
    cafes = Category.where("name LIKE ?", "%#{params}%").first.try(:cafes) || []
    reviews = Review.where("content LIKE ?", "%#{params}%")

    cafes_to_show = []

    cafes.each do |cafe|
      cafes_to_show << cafe
    end

    reviews.collect { |review| review.cafe }.uniq.each do | cafe|
      cafes_to_show << cafe
    end

    cafes_to_show
  end

  def category_attributes=(params)
    name = params[:name]
    if !name.empty?
      category = Category.find_or_create_by(name: name.downcase.strip)
      self.categories << category unless self.categories.include?(category)
    end
  end

end
