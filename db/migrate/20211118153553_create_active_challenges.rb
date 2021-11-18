class CreateActiveChallenges < ActiveRecord::Migration[6.1]
  def change
    create_table :active_challenges do |t|

      t.timestamps
    end
  end
end
