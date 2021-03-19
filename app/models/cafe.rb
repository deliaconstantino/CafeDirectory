class Cafe < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_many :cafe_categories
  has_many :categories, through: :cafe_categories

  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true

  validates :open_hour, presence: true
  validates :open_minute, presence: true
  validates :close_hour, presence: true
  validates :close_minute, presence: true

  accepts_nested_attributes_for :categories

  scope :filter_by_state, -> (params) { where("state = ?", params) }

  # def self.filter_by_state(params)
  #   # binding.pry
  #   where(state: params)
  # end

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
