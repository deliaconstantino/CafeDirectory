class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :cafes, through: :reviews
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    where(email: auth[:info][:email]).first_or_initialize do |user|
      user.username = auth[:info][:email].split("@").first
      user.email = auth[:info][:email]
      user.password = SecureRandom.hex
    end
  end

end
