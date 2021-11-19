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