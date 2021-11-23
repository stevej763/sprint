class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_secure_password
  has_one_attached :profile_image
  has_one :active_challenge
  has_many :completed_challenges
end
