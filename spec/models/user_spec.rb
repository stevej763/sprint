require 'rails_helper'

RSpec.describe User, type: :model do
  context "must have username and password" do
    it "is valid with a username and password" do
      result = User.create(username: "test", password_digest: "test")
      expect(result).to be_valid
    end

    it "is invalid without a username" do
      result = User.create(password_digest: "test")
      expect(result).to_not be_valid
    end

    it "is invalid without a password" do
      result = User.create(username: "test")
      expect(result).to_not be_valid
    end
  end

  context "can have an active challenge" do
    it "does not have an active challenge" do
      result = User.create(username: "test", password_digest: "test")
      expect(result.active_challenge).to eq nil
    end

    it "does has an active challenge" do
      result = User.create(username: "test", password_digest: "test")
      challenge = ActiveChallenge.create(user_id: result.id)
      expect(result.active_challenge).to eq challenge
    end
  end

  context "can have many completed challenges" do
    it "does not have any completed challenge" do
      result = User.create(username: "test", password_digest: "test")
      expect(result.completed_challenges).to eq []
    end

    it "does have a completed challenge" do
      result = User.create(username: "test", password_digest: "test")
      challenge = CompletedChallenge.create(user_id: result.id)
      expect(result.completed_challenges).to eq [challenge]
    end
  end

end
