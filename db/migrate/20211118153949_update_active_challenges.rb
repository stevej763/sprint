class UpdateActiveChallenges < ActiveRecord::Migration[6.1]
  def change
    add_column :active_challenges, :current_distance, :decimal, precision: 10, scale: 2, default: 0
    add_reference :active_challenges, :challenge
    add_belongs_to :active_challenges, :user
  end
end
