require 'rails_helper'
RSpec.feature "User can sign out", :type => :feature do
  fixtures :users
  scenario "User can click sign in and access their account" do
    sign_in_existing_user
    click_link "Sign out"
    expect(page).to have_current_path("/")
    expect(page).to have_content("You have signed out.")
    visit("/homepage")
    expect(page).to have_current_path("/")
  end
end
