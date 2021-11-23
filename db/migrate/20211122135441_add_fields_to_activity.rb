class AddFieldsToActivity < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :distance, :decimal, precision: 10, scale: 2, default: 0
    add_belongs_to :activities, :user
    add_belongs_to :activities, :active_challenge
    add_belongs_to :activities, :completed_challenge
  end
end

