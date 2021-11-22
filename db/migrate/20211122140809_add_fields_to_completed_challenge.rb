class AddFieldsToCompletedChallenge < ActiveRecord::Migration[6.1]
  def change
    add_reference :completed_challenges, :challenge
    add_belongs_to :completed_challenges, :user
  end
end
