require 'rails_helper'
RSpec.feature "Adding distance", :type => :feature do
  fixtures :users, :challenge, :active_challenge
  context "User inputs distance" do
    scenario "from add distance page" do
      sign_in_user_with_active_challenge
      click_button "Add distance"
      fill_in "distance", with: "10"
      click_button "Add distance"
      expect(page).to have_current_path('/completed-challenge/1')
      expect(page).to have_content 'You have completed:'
      expect(page).to have_content 'Test challenge'
      expect(page).to have_button 'View your badges'

    end
  end
end