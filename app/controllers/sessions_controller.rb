class SessionsController < ApplicationController
  
  skip_before_action :authorized, only: [:sign_in, :create]
  
  def sign_in
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
    @challenges = Challenge.all
  end

end
