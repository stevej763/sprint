class ActiveChallenge < ApplicationRecord
  belongs_to :user
  references :challenge
  has_many :activities
end
