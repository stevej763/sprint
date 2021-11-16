require 'rails_helper'
RSpec.feature "User sign in", :type => :feature do
  fixtures :users
    scenario "User can click sign in and access their account" do
      visit "/"
      click_button "Sign in"

      expect(page).to have_current_path("/sign-in")
      fill_in "username", with: "user1"
      fill_in "password", with: "password1"
      click_button "Sign in"

      expect(page).to have_current_path("/homepage")
      expect(find_by_id("current_user").text).to eq("user1")
    end
  end