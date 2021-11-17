class CreateChallenges < ActiveRecord::Migration[6.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :icon_link
      t.string :description
      t.string :difficulty
      t.integer :distance
      t.string :badge_link

      t.timestamps
    end
  end
end
