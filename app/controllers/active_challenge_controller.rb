class ActiveChallengeController < ApplicationController
  include ActivityUpdate
  
  def active_challenge
    @active_challenge = user_active_challenge
    @challenge = active_challenge_parent_challenge
    @remaining_distance = remaining_distance
    @current_distance = user_active_challenge.current_distance
    @activities = user_active_challenge.activities.order(created_at: :desc)
  end

  def create
    active_challenge = ActiveChallenge.create(challenge_id: params.require(:challenge_id), user_id: current_user.id)
    redirect_to active_challenge_url
  end

  def add_activity
    @challenge = active_challenge_parent_challenge
    @active_challenge_id = params.require(:id)
    @activity = Activity.new
  end
  
  def update_challenge
    Activity.create(activity_params)
    distance = (params.require(:activity).permit(:distance)[:distance]).to_f
    update_challenge_distance(distance)
  end

  def quit_challenge
    @active_challenge = user_active_challenge
  end

  def quit_challenge_confirmed
    user_active_challenge.destroy
    redirect_to '/'
    flash[:message] = "You have quit the challenge."
  end

  private 

  def activity_params
    params.require(:activity).permit(:name, :distance, :active_challenge_id, :user_id)
  end

  def remaining_distance
    active_challenge_parent_challenge.distance - user_active_challenge.current_distance
  end

end
