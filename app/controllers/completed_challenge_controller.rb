class CompletedChallengeController < ApplicationController
  def complete
    @challenge = Challenge.find_by(id: challenge_id)
  end

  def completed_challenge_log
    @completed_challenge = CompletedChallenge.find_by(id: challenge_id)
    @parent_challenge = Challenge.find_by(id: @completed_challenge.challenge_id)
  end

  private 

  def challenge_id
    params.require(:id)
  end

end