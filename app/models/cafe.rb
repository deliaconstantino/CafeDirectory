class Cafe < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_many :cafe_categories
  has_many :categories, through: :cafe_categories
end
