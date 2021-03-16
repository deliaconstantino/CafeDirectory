class Review < ApplicationRecord
  belongs_to :user
  belongs_to :cafe

  validates :rating, presence: true
end
