require 'rails_helper'
RSpec.feature "Adding distance", :type => :feature do
  fixtures :users, :challenge, :active_challenge
  context "User inputs distance" do
    scenario "from add distance page" do
      sign_in_user_with_active_challenge
      expect(page).to have_current_path('/active-challenge')
      click_button "Add distance"
      expect(page).to have_current_path('/add-distance/1')
      fill_in "distance", with: "2.5"
      click_button "Add distance"
      expect(page).to have_current_path('/active-challenge')
      expect(page).to have_selector '#total-distance', text: '10 miles'
      expect(page).to have_selector '#current-distance', text: '2.5 miles'
      expect(page).to have_selector '#remaining-distance', text: '7.5 miles'
    end
  end
end