class SessionsController < ApplicationController
  
  skip_before_action :authorized, only: [:sign_in, :create]
  
  def sign_in
    redirect_logged_in_users
  end

  def sign_out
    session.delete(:user_id)
    redirect_to root_url
    flash[:message] = "You have signed out."
  end
  
  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to homepage_url
      flash[:message] = "You have signed in."
    else
      redirect_to sign_in_url
      flash[:message] = "Incorrect details, please try again."
    end
  end

  def homepage
    if !current_user.active_challenge.nil?
      redirect_to "/active-challenge"
    end
    completed_challenge_ids = current_user.completed_challenges.map { |completed_challenge| completed_challenge.challenge_id}
    @challenges = Challenge.all.filter { |challenge| !completed_challenge_ids.include?(challenge.id)}
    @empty_page_message = "You are unstoppable... Watch this space!"
  end

  def profile
    @completed_challenges = []
    current_user.completed_challenges.each do |completed_challenge|
      completed_challenge = {challenge: Challenge.find_by(id: completed_challenge.challenge_id), id: completed_challenge.id}
      @completed_challenges << completed_challenge
    end
  end 

end
