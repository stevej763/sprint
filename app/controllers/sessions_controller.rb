class SessionsController < ApplicationController
  
  skip_before_action :authorized, only: [:sign_in, :create]
  
  def sign_in
  end

  def sign_out
    session.delete(:user_id)
    redirect_to root_url
  end

  
  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      
      redirect_to homepage_url
    else
      render "sign_in"
    end
  end

  def homepage
  end

end
