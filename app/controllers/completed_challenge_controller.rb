class CompletedChallengeController < ApplicationController
  def complete
    @challenge = Challenge.find_by(id: challenge_id)
  end
end

private 

def challenge_id
  params.require(:id)
end