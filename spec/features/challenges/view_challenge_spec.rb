require 'rails_helper'
RSpec.feature "Viewing challenges", :type => :feature do
  fixtures :users, :challenge
  scenario "User can click sign up and create their account" do
    sign_in_existing_user
    visit("/challenge/1")
    expect(page).to have_content("Test challenge")
    expect(page).to have_content("This is a challenge") 
    expect(page).to have_content("Easy")
    expect(page).to have_content("10")

  end
end
