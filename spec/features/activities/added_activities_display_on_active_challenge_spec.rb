require 'rails_helper'

RSpec.feature "Displaying activities on active challenge page", :type => :feature do
  fixtures :users, :challenge, :active_challenge
  context "User adds activity" do
    scenario "and activity is displayed on active challenge" do
      sign_in_user_with_active_challenge
      expect(page).to have_current_path('/active-challenge')
      click_button "Add activity"
      expect(page).to have_current_path('/add-activity/1')
      fill_in "activity_name", with: "My activity"
      fill_in "activity_distance", with: "2.5"
      click_button "Add activity"
      expect(page).to have_current_path('/active-challenge')
      expect(page).to have_selector '#activities'
      expect(page).to have_content('My activity')
    end
  end
end