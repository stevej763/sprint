class AddStravaDetailsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :access_token, :string
    add_column :users, :refresh_token, :string
    add_column :users, :strava_athlete_id, :string
    add_column :users, :strava_expires_at, :datetime
  end
end
