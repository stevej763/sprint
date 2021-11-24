require 'rails_helper'

RSpec.describe ActiveChallenge, type: :model do
  fixtures :users
  context "must have a user id" do
    it "does not have a user_id" do
      result = ActiveChallenge.create()
      expect(result).to_not be_valid
    end
    it "has a user_id" do
      result = ActiveChallenge.create(user_id: "1")
      expect(result).to be_valid 
    end
  end   
  context "must have a valid user id" do
    it "does not have a valid user_id" do
      result = ActiveChallenge.create(user_id: "10000")
      expect(result).to_not be_valid
    end
    it "has a valid user_id" do
      result = ActiveChallenge.create(user_id: "1")
      expect(result).to be_valid 
    end
  end  

  it "has an empty array of activities by default" do
    subject = ActiveChallenge.create(user_id: "1")
    expect(subject.activities).to eq []
  end
  
 
end
