class AddLastSyncFieldToActiveChallenge < ActiveRecord::Migration[6.1]
  def change
    add_column :active_challenges, :last_sync, :datetime
  end
end
