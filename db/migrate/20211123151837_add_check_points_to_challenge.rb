class AddCheckPointsToChallenge < ActiveRecord::Migration[6.1]
  def change
    add_column :challenges, :checkpoints, :text, array: true, default: []
  end
end
