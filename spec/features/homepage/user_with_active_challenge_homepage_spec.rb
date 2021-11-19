require 'rails_helper'
RSpec.feature "Active challenge homepage:", :type => :feature do
  fixtures :users, :challenge
  context "User sees their active challenge" do
    scenario "on the homepage" do
      sign_in_existing_user
      sign_up_for_challenge
      visit('/homepage')
      expect(page).to have_current_path('/active-challenge')
    end
  end
end