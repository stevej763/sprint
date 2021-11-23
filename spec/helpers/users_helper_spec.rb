require 'rails_helper'

def sign_in_existing_user
  visit("/sign-in")
  fill_in "username", with: "user1"
  fill_in "password", with: "password1"
  click_button "Sign in"
end

def sign_in_user_with_active_challenge
  visit("/sign-in")
  fill_in "username", with: "user2"
  fill_in "password", with: "password2"
  click_button "Sign in"
end

def sign_up_user
  visit "/"
  click_button "Sign up"

  expect(page).to have_current_path("/sign-up")
  fill_in "user_username", with: "test"
  fill_in "user_password", with: "password"
  click_button "Sign up"

  expect(page).to have_current_path("/homepage")
  expect(find_by_id("current_user").text).to eq("test")
  expect(page).to have_content("You have signed up.")
end