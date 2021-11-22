class StravaApiController < ApplicationController

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
    current_user.update(access_token: response.access_token, refresh_token: response.refresh_token, strava_athlete_id: response.athlete.id, strava_expires_at: response.expires_at)
    redirect_to '/'
  end

  def sync_activties
    current_challenge = ActiveChallenge.find_by(id: params.require(:id))
    parent_challenge = Challenge.find_by(id: current_challenge.challenge_id)
    after_date = current_challenge.last_sync.nil? current_challenge.created_date
    activities = strava_user_client.athlete_activities(after: current_challenge.last_sync)
    current_challenge.update(last_sync: Time.now)
    total_distance = 0
    activities.each do |activity|
      distance_in_miles = activity.distance / 1600
      total_distance += distance_in_miles
      Activity.create(name: activity.name, distance: distance_in_miles, user_id: current_user.id, active_challenge_id: params.require(:id))
    end

    new_distance = current_challenge.current_distance + total_distance

    if new_distance >= parent_challenge.distance
      completed_challenge = CompletedChallenge.create(challenge_id: current_challenge.challenge_id, user_id: current_challenge.user_id)
      update_activities(current_challenge.id, completed_challenge.id)
      current_challenge.destroy
      redirect_to "/completed-challenge/#{parent_challenge.id}"
    else   
      current_challenge.update(current_distance: new_distance)
      redirect_to '/'
    end
  end

  private 

  def update_activities(current_challenge_id, completed_challenge_id)
    Activity.where(active_challenge_id: current_challenge_id).each {|activity| activity.update(completed_challenge_id: completed_challenge_id)}
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
