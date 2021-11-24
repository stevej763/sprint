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
  
  context "calculate checkpoint completion " do 
    let(:checkpoints) {["1","2","3","4","5"]}
    let(:subject) { described_class.new(title:"test", distance:5.0, checkpoints: checkpoints) }
    it "has expected checkpoints" do
      expect(subject.checkpoints).to eq checkpoints
    end 
    it "completes first checkpoint" do
      result = subject.checkpoint_complete?(1,0)
      expect(result).to eq "complete"
    end   
    it "does not complete checkpoint" do
      result = subject.checkpoint_complete?(0.5,0)
      expect(result).to_not eq "complete"
    end   
    it "fills in final checkpoint" do
      result = subject.checkpoint_complete?(5,4)
      expect(result).to eq "complete"
    end   
  end     
end
