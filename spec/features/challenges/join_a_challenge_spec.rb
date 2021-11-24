require 'rails_helper'
RSpec.feature "Joining a challenge:", :type => :feature do
  fixtures :users, :challenge
  context "User joins a challenge" do
    scenario "from the homepage" do
      sign_in_existing_user
      click_button "Test challenge"
      expect(page).to have_current_path('/challenge/1')
      click_button "Join"
      expect(page).to have_current_path('/active-challenge')
      expect(page).to have_content("Active Challenge")
      expect(page).to have_selector '#total-distance', text: '10 miles'
      expect(page).to have_selector '#current-distance', text: '0.0 miles'
      expect(page).to have_selector '#remaining-distance', text: '10.0 miles'
      expect(page).to have_button 'Add activity'
      expect(page).to have_content 'Have a Strava account?'
      expect(page).to have_button 'Link Strava'
    end
  end
end