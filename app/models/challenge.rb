class Challenge < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    has_one_attached :badge
    has_one_attached :icon
end
