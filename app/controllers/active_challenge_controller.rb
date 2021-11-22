class ActiveChallengeController < ApplicationController
  
  def active_challenge
    @active_challenge = current_challenge
    @challenge = find_linked_challenge
    @remaining_distance = remaining_distance
  end

  def create
    active_challenge = ActiveChallenge.create(challenge_id: params.require(:challenge_id), user_id: current_user.id)
    redirect_to active_challenge_url
  end

  def add_activity
    @challenge = find_linked_challenge
    @active_challenge_id = active_challenge_id
    @activity = Activity.new
  end
  
  def update_challenge
    Activity.create(activity_params)
    update_challenge_distance(params.require(:activity).permit(:distance)[:distance], params.require(:activity).permit(:active_challenge_id)[:active_challenge_id])
  end   

  private 

  def activity_params
    params.require(:activity).permit(:name, :distance, :active_challenge_id, :user_id)
  end

  def current_challenge
    current_user.active_challenge
  end

  def find_linked_challenge
    Challenge.find_by(id: current_user.active_challenge.challenge_id)
  end

  def remaining_distance
    @challenge.distance - current_user.active_challenge.current_distance
  end

  def active_challenge_id
    params.require(:id)
  end

  def update_challenge_distance(distance, active_challenge_id)
    parent_challenge = find_linked_challenge
    active_challenge = ActiveChallenge.find_by(id: active_challenge_id)
    new_distance = active_challenge.current_distance + distance.to_f
    if new_distance >= parent_challenge.distance
      completed_challenge = CompletedChallenge.create(challenge_id: current_challenge.id, user_id: current_challenge.user_id)
      update_activities(current_challenge.id, completed_challenge.id)
      current_challenge.destroy
      redirect_to "/completed-challenge/#{parent_challenge.id}"
    else   
      active_challenge.update(current_distance: new_distance)
      redirect_to active_challenge_url
    end   
  end

  def update_activities(current_challenge_id, completed_challenge_id)
    Activity.where(active_challenge_id: current_challenge_id).each {|activity| activity.update(completed_challenge_id: completed_challenge_id)}
  end

end
