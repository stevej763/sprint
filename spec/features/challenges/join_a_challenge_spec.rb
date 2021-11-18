require 'rails_helper'
RSpec.feature "Joining a challenge:", :type => :feature do
  fixtures :users, :challenge
  context "User joins a challenge" do
    scenario "from the homepage" do
      sign_in_existing_user
      click_button "Test challenge"
      expect(page).to have_current_path('/challenge/1')
      click_button "Join"
      expect(page).to have_current_path('/homepage')
      expect(page).to have_content("Current Challenge")
    end
  end
end