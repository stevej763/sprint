class CreateCompletedChallenges < ActiveRecord::Migration[6.1]
  def change
    create_table :completed_challenges do |t|

      t.timestamps
    end
  end
end
