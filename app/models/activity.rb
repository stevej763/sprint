class Activity < ApplicationRecord
  validates :name, presence: true
  validates :distance, presence: true
  validates :user_id, presence: true
  has_one_attached :activity_map
  belongs_to :user
end
