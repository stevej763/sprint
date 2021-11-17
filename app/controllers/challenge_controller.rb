class ChallengeController < ApplicationController
  def challenge
    @challenge = Challenge.find_by(id: challenge_id)
  end

  private 

  def challenge_id
    params.require(:id)
  end
end
