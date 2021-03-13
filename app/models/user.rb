class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :cafes, through: :reviews
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

end
