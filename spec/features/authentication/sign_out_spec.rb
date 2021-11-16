require 'rails_helper'
RSpec.feature "User can sign out", :type => :feature do
  fixtures :users
    scenario "User can click sign in and access their account" do
      sign_in_existing_user
      click_button "Sign out"
      expect(page).to have_current_path("/")
      visit("/homepage")
      expect(page).to have_current_path("/")

    end
    scenario "User fails sign in attempt" do
      visit "/sign-in"
      
      fill_in "username", with: "wrong"
      fill_in "password", with: "wrong"
      click_button "Sign in"

      expect(page).to have_current_path("/sign-in")
    end
  end