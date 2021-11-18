class UsersController < ApplicationController

  skip_before_action :authorized

  def sign_up
    @user = User.new
  end

  def create
    @user = User.create(user_details)
    session[:user_id] = @user.id
    redirect_to homepage_url
    flash[:message] = "You have signed up."
  end

  private 

  def user_details
    params.require(:user).permit(:username, :password, :profile_image)
  end
end
