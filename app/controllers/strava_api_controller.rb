require 'open-uri'

class StravaApiController < ApplicationController
  include ActivityUpdate

  def link_with_strava
    client = strava_oauth_client
    redirect_url = client.authorize_url(
      redirect_uri: ENV['STRAVA_REDIRECT_URL'],
      approval_prompt: 'force',
      response_type: 'code',
      scope: 'activity:read_all',
      state: 'magic'
    )
    redirect_to redirect_url
  end

  def oauth
    client = strava_oauth_client
    response = client.oauth_token(code: params.require(:code))
    current_user.update(
      access_token: response.access_token, 
      refresh_token: response.refresh_token, 
      strava_athlete_id: response.athlete.id, 
      strava_expires_at: response.expires_at
    )
    redirect_to '/'
  end

  def sync_strava_activties
    if current_user.strava_expires_at >= Time.now
      response = strava_oauth_client.oauth_token(
        refresh_token: current_user.refresh_token,
        grant_type: 'refresh_token'
      )
      current_user.update(
        refresh_token: response.refresh_token, 
        access_token: response.access_token,
        strava_expires_at: response.expires_at
        )
    end
    total_distance = 0
    activities = new_strava_activities
    activities.each do |strava_activity|
      distance_in_miles = strava_activity.distance / 1600
      total_distance += distance_in_miles
      new_activity = Activity.create(
        name: strava_activity.name, 
        distance: distance_in_miles, 
        user_id: current_user.id, 
        active_challenge_id: user_active_challenge.id
      )
      save_map(strava_activity, new_activity)
    end
    user_active_challenge.update(last_sync: Time.now)
    update_challenge_distance(total_distance)
    flash_update(activities)
    
  end

  private

  def flash_update(activities)
    if activities.count == 0
      flash[:message] = "Sync complete - No new activities found."
    elsif activities.count == 1
      flash[:message] = "Sync complete - 1 activity added"
    else 
      flash[:message] = "Sync complete - #{activities.count} activities added"
    end
  end

  def save_map(strava_activity, new_activity)
    if strava_activity.map.summary_polyline != nil

      image = URI.open(build_map_image(strava_activity.map))
      new_activity.activity_map.attach(io: image, filename: strava_activity.name)
    end
  end

  def build_map_image(map)
    decoded_summary_polyline = Polylines::Decoder.decode_polyline(map.summary_polyline)
    start_latlng = decoded_summary_polyline[0]
    end_latlng = decoded_summary_polyline[-1]

    google_maps_api_key = ENV['GOOGLE_STATIC_MAPS_API_KEY']
    base_url = "https://maps.googleapis.com/maps/api/staticmap?maptype=roadmap&size=600x400"
    markers = "color:0x72EF36|label:S|#{start_latlng[0]},#{start_latlng[1]}&markers=color:0xE75462|label:F|#{end_latlng[0]},#{end_latlng[1]}"
    google_image_url = "#{base_url}&key=#{google_maps_api_key}&path=enc:#{map.summary_polyline}&markers=#{markers}"
    return google_image_url
  end

  def new_strava_activities
    strava_user_client.athlete_activities(after: calculateDateToSyncFrom)
  end

  def calculateDateToSyncFrom
    user_active_challenge.last_sync.nil? ? user_active_challenge.created_at : user_active_challenge.last_sync
  end

  def strava_user_client
    client = Strava::Api::Client.new(
      access_token: current_user.access_token
    )
  end

  def strava_oauth_client
    client = Strava::OAuth::Client.new(
      client_id: ENV['STRAVA_CLIENT_ID'],
      client_secret: ENV['STRAVA_CLIENT_SECRET']
    )
  end

end
