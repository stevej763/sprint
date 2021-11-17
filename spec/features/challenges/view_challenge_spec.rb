require 'rails_helper'
RSpec.feature "Viewing challenges:", :type => :feature do
  fixtures :users, :challenge
  context "User goes to a" do
    scenario "valid challenge page." do
      sign_in_existing_user
      visit("/challenge/1")
      expect(page).to have_content("Test challenge")
      expect(page).to have_content("This is a challenge") 
      expect(page).to have_content("Easy")
      expect(page).to have_content("10")
      expect(page).to_not have_content("That challenge id does not exist")

    end
    scenario "n invalid challenge page" do
      sign_in_existing_user
      visit("/challenge/1000")
      expect(page).to have_content("That challenge id does not exist")

    end
  end
  
end
