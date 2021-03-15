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
end
