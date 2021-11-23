module ActivityUpdate
  extend ActiveSupport::Concern
  
  def update_challenge_distance(activity_distance)
    new_distance = user_active_challenge.current_distance + activity_distance
    if new_distance >= active_challenge_parent_challenge.distance
      complete_challenge
    else
      user_active_challenge.update(current_distance: new_distance)
      redirect_to '/'
    end
  end

  private

  def complete_challenge
    completed_challenge = CompletedChallenge.create(challenge_id: user_active_challenge.challenge_id, user_id: user_active_challenge.user_id)
    Activity.where(active_challenge_id: user_active_challenge.id).each do |activity| 
      activity.update(completed_challenge_id: completed_challenge.id)
    end
    user_active_challenge.destroy
    redirect_to "/completed-challenge/#{completed_challenge.challenge_id}"
  end
  
end