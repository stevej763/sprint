require 'rails_helper'
RSpec.feature "user Sign up", :type => :feature do
    scenario "User can click sign up and create their account" do
      visit "/"
      click_button "Sign up"

      expect(page).to have_current_path("/sign-up")
      fill_in "username", with: "test"
      fill_in "password", with: "password"
      click_button "Sign up"

      expect(page).to have_current_path("/homepage")
      expect(find_by_id("current_user")).to eq("test")
    end
  end