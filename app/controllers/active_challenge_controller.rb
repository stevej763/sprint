class ActiveChallengeController < ApplicationController
  
  def active_challenge
    @challenge = find_linked_challenge
  end

  def create
    active_challenge = ActiveChallenge.create(challenge_id: params.require(:challenge_id), user_id: current_user.id)
    redirect_to active_challenge_url
  end

  private 

  def find_linked_challenge
    Challenge.find_by(id: current_user.active_challenge.challenge_id)
  end

end
