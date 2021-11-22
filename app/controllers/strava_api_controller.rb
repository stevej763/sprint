class StravaApiController < ApplicationController

  def link_with_strava
    client = strava_client
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
    client = strava_client
    response = client.oauth_token(code: params.require(:code))
    current_user.update(access_token: response.access_token, refresh_token: response.refresh_token, strava_athlete_id: response.athlete.id, strava_expires_at: response.expires_at)
    redirect_to '/'
  end

  private 

  def strava_client
    client = Strava::OAuth::Client.new(
      client_id: ENV['STRAVA_CLIENT_ID'],
      client_secret: ENV['STRAVA_CLIENT_SECRET']
    )
  end
end
