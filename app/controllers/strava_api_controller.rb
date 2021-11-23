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
      response = strava_user_client.oauth_token(
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
    new_strava_activities.each do |strava_activity|
      distance_in_miles = strava_activity.distance / 1600
      total_distance += distance_in_miles
      Activity.create(
        name: strava_activity.name, 
        distance: distance_in_miles, 
        user_id: current_user.id, 
        active_challenge_id: user_active_challenge.id
      )
    end
    user_active_challenge.update(last_sync: Time.now)
    update_challenge_distance(total_distance)
  end

  private 

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
