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

  def self.search(params)
    # require 'pry'; binding.pry
    cafes = Category.where("name LIKE ?", "%#{params}%").first.try(:cafes)
    reviews = Review.where("content LIKE ?", "%#{params}%")

    if !!cafes && !!reviews
      cafes.push(reviews)
    elsif !!reviews && !cafes
      cafes = reviews.collect { |review| review.cafe }.uniq
    else
      cafes
    end
    # left_joins(:categories)
    # value = category ? category.cafes : flash.now[:message] =
    # Category.where("name LIKE ?", "%#{params}%").limit(1)[0].cafes
    # left_joins(:categories).where("LOWER(category.name) LIKE ?", "%#{params}%")
    # Cafe.where(["name = :name", { name: "%#{params}%"}])
    #SELECT "cafes".* FROM "cafes" LEFT OUTER JOIN "cafes_category" ON "cafes_category"."cafe_id" = "cafes"."id" LEFT OUTER JOIN "categories" ON "categories"."id" = "cafes_category"."category_id" WHERE (LOWER(name) LIKE '%reading%')
    #^ need to

    # Category.where("name LIKE ?", "%#{params}%").cafes

    # scope = Brand.joins(parts: :category).where(categories: { name: 'car' })
    # scope = scope.select('DISTINCT brands.name').order('brands.name')

    # brand_names_appearing_in_car_category = scope.map(&:name)
  end

  def self.by_status(status)
    where(status: status) if status.present?
  end

  def category_attributes=(name)
    if !name[:name].empty?
      self.categories << Category.find_or_create_by(name: name[:name])
    end
  end

  # def category_name=(name)
  #   # binding.pry
  #   if !name.empty?
  #     category = Category.find_or_create_by(name: name)
  #     if category && !self.categories.include?(category)
  #       self.categories << category
  #       self.save
  #     end
  #   end
  # end

  # def category_name
  #   binding.pry
  #   self.categories.present? ? self.categories : nil
  # end
end
