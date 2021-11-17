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
    expect(page).to have_content("You have signed in.")
  end
  scenario "User fails sign in attempt" do
    visit "/sign-in"
    
    fill_in "username", with: "wrong"
    fill_in "password", with: "wrong"
    click_button "Sign in"

    expect(page).to have_current_path("/sign-in")
    expect(page).to have_content("Incorrect details, please try again.")
  end

  scenario "User who is not signed in is redirect to '/'" do
    visit "/sign-in"
    click_link "Sprint"
    expect(page).to have_current_path("/")
  end

  scenario "User who is signed in is redirect to '/homepage'" do
    visit "/sign-in"
    fill_in "username", with: "user1"
    fill_in "password", with: "password1"
    click_button "Sign in"
    expect(page).to have_current_path("/homepage")
    click_link "Sprint"
    expect(page).to have_current_path("/homepage")
  end
end
