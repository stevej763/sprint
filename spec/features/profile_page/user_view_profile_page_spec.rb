require 'rails_helper'
RSpec.feature "View badges on profile page:", :type => :feature do
  fixtures :users
  
  context "user views profile page" do
    scenario "from the completed challenge page" do
      sign_in_existing_user
      visit("/profile-page")
      expect(page).to have_current_path('/profile-page')
      expect(page).to have_content('Profile page')
    end
  end
end