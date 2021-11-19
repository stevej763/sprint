class ActiveChallenge < ApplicationRecord
  belongs_to :user
  references :challenge
end
