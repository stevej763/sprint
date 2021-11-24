require 'rails_helper'
RSpec.feature "View badges on profile page:", :type => :feature do
  fixtures :users
  
  context "user views profile page" do
    scenario "from the completed challenge page" do
      sign_in_existing_user
      visit("/profile")
      expect(page).to have_current_path('/profile')
    end
    scenario "User has no completed challenges" do
      sign_in_existing_user
      visit("/profile")
      expect(page).to have_current_path('/profile')
      expect(page).to have_content('Looks a little empty here, complete a challenge to show off your badges')
      expect(page).to have_button("Find a challenge")
    end
    scenario "User has started a challenge" do
      sign_in_existing_user
      sign_up_for_challenge
      visit("/profile")
      expect(page).to have_current_path('/profile')
      expect(page).to have_content('Looks a little empty here, complete a challenge to show off your badges')
      expect(page).to have_button("Go to active challenge")
    end
    scenario "to see completed challenge badge" do
      sign_in_existing_user
      sign_up_for_challenge
      click_button "Add activity"
      fill_in "activity_name", with: "My activity"
      fill_in "activity_distance", with: "50"
      click_button "Add activity"
      expect(page).to have_current_path('/completed-challenge/1')
      click_button "View your badges"
      expect(page).to have_current_path('/profile')
      expect(page).to have_content('Test challenge')
    end
  end
end