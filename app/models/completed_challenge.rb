class CompletedChallenge < ApplicationRecord
  has_one :challenge
  has_many :activities
end
