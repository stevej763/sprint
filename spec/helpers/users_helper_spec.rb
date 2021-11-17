require 'rails_helper'

def sign_in_existing_user
  visit "/"
  click_button "Sign in"
  expect(page).to have_current_path("/sign-in")
  fill_in "username", with: "user1"
  fill_in "password", with: "password1"
  click_button "Sign in"
end

def sign_in_existing_user
  visit("/sign-in")
  fill_in "username", with: "user1"
  fill_in "password", with: "password1"
  click_button "Sign in"
end