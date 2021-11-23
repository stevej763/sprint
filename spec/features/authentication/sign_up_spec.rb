require 'rails_helper'
RSpec.feature "User sign up", :type => :feature do
  scenario "User can click sign up and create their account" do
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

  scenario "User is on /sign-up but does have an account" do
    visit "/sign-up"
    expect(page).to have_content("Have an account?")
    click_button "Sign in"
    expect(page).to have_current_path("/sign-in")
  end

  scenario "User attaches image on sign up" do
    visit('/')
    click_button("Sign up")
    expect(page).to have_current_path("/sign-up")
    fill_in "user_username", with: "test"
    fill_in "user_password", with: "password"
    attach_file('user_profile_image', File.absolute_path('./template_images/harry_potter/badge.png'))
    click_button "Sign up"
    expect(page).to have_current_path("/homepage")
    expect(find_by_id("current_user").text).to eq("test")
    expect(page).to have_selector("#user-upload")
  end

  scenario "User cannot signup without a unique username" do
    sign_up_user

    click_button "Sign out"
    expect(page).to have_current_path("/")
    expect(page).to have_content("You have signed out.")

    click_button "Sign up"
    expect(page).to have_current_path("/sign-up")
    fill_in "user_username", with: "test"
    fill_in "user_password", with: "password1"
    click_button "Sign up"
    expect(page).to have_current_path("/")
    expect(page).to have_content("Username already in use. Please try again.")
  end
end
