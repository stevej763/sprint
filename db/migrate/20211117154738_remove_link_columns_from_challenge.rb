class RemoveLinkColumnsFromChallenge < ActiveRecord::Migration[6.1]
  def change
    remove_column :challenges, :icon_link
    remove_column :challenges, :badge_link
  end
end
