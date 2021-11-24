require 'rails_helper'
RSpec.feature "Adding distance", :type => :feature do
  fixtures :users, :challenge, :active_challenge
  context "User inputs distance" do
    scenario "from add distance page" do
      sign_in_user_with_active_challenge
      expect(page).to have_current_path('/active-challenge')
      expect(find_by_id("checkpoint-index-0")[:class]).to_not eq("checkpoint-item complete")
      add_distance(1)
      expect(find_by_id("checkpoint-index-0")[:class]).to eq("checkpoint-item complete")
      expect(find_by_id("checkpoint-index-1")[:class]).to_not eq("checkpoint-item complete")
      add_distance(1)
      expect(find_by_id("checkpoint-index-1")[:class]).to eq("checkpoint-item complete")
      expect(find_by_id("checkpoint-index-2")[:class]).to_not eq("checkpoint-item complete")
      add_distance(1)
      expect(find_by_id("checkpoint-index-2")[:class]).to eq("checkpoint-item complete")
      expect(find_by_id("checkpoint-index-3")[:class]).to_not eq("checkpoint-item complete")
      add_distance(1)
      expect(find_by_id("checkpoint-index-3")[:class]).to eq("checkpoint-item complete")
      expect(find_by_id("checkpoint-index-4")[:class]).to_not eq("checkpoint-item complete")
      add_distance(1)
      expect(find_by_id("checkpoint-index-4")[:class]).to eq("checkpoint-item complete")
      expect(find_by_id("checkpoint-index-5")[:class]).to_not eq("checkpoint-item complete")
      add_distance(1)
      expect(find_by_id("checkpoint-index-5")[:class]).to eq("checkpoint-item complete")
      expect(find_by_id("checkpoint-index-6")[:class]).to_not eq("checkpoint-item complete")
      add_distance(1)
      expect(find_by_id("checkpoint-index-6")[:class]).to eq("checkpoint-item complete")
      expect(find_by_id("checkpoint-index-7")[:class]).to_not eq("checkpoint-item complete")
      add_distance(1)
      expect(find_by_id("checkpoint-index-7")[:class]).to eq("checkpoint-item complete")
      expect(find_by_id("checkpoint-index-8")[:class]).to_not eq("checkpoint-item complete")
      add_distance(1)
      expect(find_by_id("checkpoint-index-8")[:class]).to eq("checkpoint-item complete")
      expect(find_by_id("checkpoint-index-9")[:class]).to_not eq("checkpoint-item complete")
      add_distance(1)
      expect(page).to have_current_path "/completed-challenge/1"
    end
  end
end

def add_distance(distance)
  click_button "Add activity"
  expect(page).to have_current_path('/add-activity/1')
  fill_in "activity_name", with: "My activity"
  fill_in "activity_distance", with: distance
  click_button "Add activity"
end