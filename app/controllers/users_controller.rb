class UsersController < ApplicationController

  skip_before_action :authorized

  def sign_up
    redirect_logged_in_users
    @user = User.new
  end

  def create
    @user = User.create(user_details)
    session[:user_id] = @user.id
    if @user.id != nil
      redirect_to homepage_url
      flash[:message] = "You have signed up."
    else 
      redirect_to sign_up_url
      flash[:message] = "Username already in use. Please try again."
    end   
  end

  private 

  def user_details
    params.require(:user).permit(:username, :password, :profile_image)
  end
end
