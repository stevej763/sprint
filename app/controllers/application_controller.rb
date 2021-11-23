class ApplicationController < ActionController::Base

  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  helper_method :redirect_logged_in_users
  helper_method :user_active_challenge
  helper_method :active_challenge_parent_challenge

  def current_user    
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?  
  end

  def authorized
    redirect_to root_url unless logged_in?
  end

  def redirect_logged_in_users
    redirect_to homepage_url unless !logged_in? 
  end

  def user_active_challenge
    current_user.active_challenge
  end

  def active_challenge_parent_challenge
    Challenge.find_by(id: user_active_challenge.challenge_id)
  end

end
