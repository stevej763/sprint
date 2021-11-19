require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ActiveChallengeHelper. For example:
#
# describe ActiveChallengeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

def sign_up_for_challenge
  click_button "Test challenge"
  expect(page).to have_current_path('/challenge/1')
  click_button "Join"
end