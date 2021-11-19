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
  
  def add_distance
    @active_challenge_id = active_challenge_id
  end 
  
  def update_distance
    puts 'end point hit'
  end   

  private 

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

end
