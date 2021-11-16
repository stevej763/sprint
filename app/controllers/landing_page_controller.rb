class LandingPageController < ApplicationController
  skip_before_action :authorized
  
  def landing_page
  end
end
