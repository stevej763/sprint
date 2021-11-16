require 'rails_helper'

RSpec.describe User, type: :model do
  context "must have username and password" do
    it "is valid with a username and password" do
      result = User.create(username: "test", password_digest: "test" )
      expect(result).to be_valid
    end

    it "is invalid without a username" do
      result = User.create(password_digest: "test" )
      expect(result).to_not be_valid
    end

    it "is invalid without a password" do
      result = User.create(username: "test" )
      expect(result).to_not be_valid
    end
  end
end
