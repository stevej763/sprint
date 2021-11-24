require 'rails_helper'
RSpec.feature "All challenges done", :type => :feature do
  fixtures :users, :challenge, :active_challenge
  scenario "User visits homepage with no challenges available" do
    sign_in_user_with_active_challenge
    click_button "Add activity"
    fill_in "activity_name", with: "My activity"
    fill_in "activity_distance", with: "50"
    click_button "Add activity"
    expect(page).to have_current_path('/completed-challenge/1')
    expect(page).to have_content 'You have completed:'
    expect(page).to have_content 'Test challenge'
    expect(page).to have_button 'View your badges'
    visit('/homepage')
    expect(page).to have_content("You are unstoppable... Watch this space!")
  end
end