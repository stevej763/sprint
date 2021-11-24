require 'rails_helper'

RSpec.feature "Quit active challenge", :type => :feature do
  fixtures :users, :challenge, :active_challenge
  context "A user can quit a challenge" do
    scenario "when a they click the quit challenge button" do
      sign_in_user_with_active_challenge
      expect(page).to have_current_path('/active-challenge')
      click_button("Quit challenge")
      expect(page).to have_current_path('/quit-challenge')
      expect(page).to have_content("Quit challenge")
      expect(page).to have_content("Are you sure you want to quit this challenge?") 
      expect(page).to have_content("All challenge progress will be lost.")
      expect(page).to have_content("Test challenge")
      expect(page).to have_button("Yes")
      expect(page).to have_button("No")
      click_button("Yes")
      expect(page).to have_current_path('/homepage')
    end
  end

  context "A user can change their mind when quitting a challenge" do
    scenario "when a they click the quit challenge button" do
      sign_in_user_with_active_challenge
      expect(page).to have_current_path('/active-challenge')
      click_button("Quit challenge")
      expect(page).to have_current_path('/quit-challenge')
      expect(page).to have_content("Quit challenge")
      expect(page).to have_content("Are you sure you want to quit this challenge?") 
      expect(page).to have_content("All challenge progress will be lost.")
      expect(page).to have_content("Test challenge")
      expect(page).to have_button("Yes")
      expect(page).to have_button("No")
      click_button("No")
      expect(page).to have_current_path('/active-challenge')
    end
  end
  
end