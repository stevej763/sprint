class SessionsController < ApplicationController
  
  skip_before_action :authorized, only: [:sign_in, :create]
  
  def sign_in
  end

  def homepage
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
end
