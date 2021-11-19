class LandingPageController < ApplicationController
  skip_before_action :authorized
  
  def landing_page
    redirect_logged_in_users
  end
end
