require 'rails_helper'

RSpec.describe Challenge, type: :model do
  context "must have a title" do
    it "does not have a title" do
      result = Challenge.create()
      expect(result).to_not be_valid
    end
    it "has a title" do
      result = Challenge.create(title: "test1")
      expect(result).to be_valid 
    end
  end   
  
  context "must have a unique title" do
    it "has a unique name" do
      Challenge.create(title: "test1")
      result = Challenge.create(title: "test2")
      expect(result).to be_valid
    end
    it "has a dublicate name" do
      Challenge.create(title: "test1")
      result = Challenge.create(title: "test1")
      expect(result).to_not be_valid
    end
  end   

  context "Checkpoint gets highlighted" do
    it "has a unique name" do
      Challenge.create(title: "test1")
      result = Challenge.create(title: "test2")
      expect(result).to be_valid
    end
    it "has a dublicate name" do
      Challenge.create(title: "test1")
      result = Challenge.create(title: "test1")
      expect(result).to_not be_valid
    end
  end   
end
