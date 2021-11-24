require 'rails_helper'

RSpec.describe Activity, type: :model do
  fixtures :users
  context "must have all required fields" do
    it "does not have a name" do
      result = Activity.create(distance: 1.5, user_id: "1")
      expect(result).to_not be_valid
    end
    it "distance is defaulted to 0" do
      result = Activity.create(name: "activity name", user_id: "1")
      expect(result.distance).to eq 0.0.to_d
    end
    it "does not have a user_id" do
      result = Activity.create(name: "activity name", distance: "1")
      expect(result).to_not be_valid
    end
    it "has a name" do
      result = Activity.create(name: "test1", user_id: "1")
      expect(result).to be_valid 
    end

    it "must belong to a user id that exists" do
      result = Activity.create(name: "test1", user_id: "invalid")
      expect(result).to_not be_valid 
    end
    
  end   
  
end
