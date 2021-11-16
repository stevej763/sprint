class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username,        
   :password))
    session[:user_id] = @user.id
    redirect_to homepage_url
  end
end
