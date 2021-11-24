require 'rails_helper'

RSpec.feature "User can see activities for a completed challenge", :type => :feature do
  fixtures :users, :completed_challenge, :activity
    scenario "user clicks on completed challenge badge" do
      sign_in_user_with_completed_challenge
      click_link("profile-link")
      expect(page).to have_current_path('/profile')
      expect(page).to have_content('Test challenge')
      click_button "view-activities-challenge-1"
      expect(page).to have_current_path('/completed-challenge-activity-log/1')
      expect(page).to have_content("My activity one")
      expect(page).to have_content("My activity two")
    end
end
