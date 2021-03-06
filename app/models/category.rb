class Category < ApplicationRecord
  has_many :cafe_categories
  has_many :cafes, through: :cafe_categories

  validates :name, presence: true
  validates :name, uniqueness: true

end
