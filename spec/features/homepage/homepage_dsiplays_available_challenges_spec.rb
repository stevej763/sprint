require 'rails_helper'
RSpec.feature "Viewing challenges on homepage:", :type => :feature do
  fixtures :users, :challenge
  context "User views a challenge" do
    scenario "from the homepage" do
      sign_in_existing_user
      click_button "Test challenge"
      expect(page).to have_current_path('/challenge/1')
    end
  end
end
