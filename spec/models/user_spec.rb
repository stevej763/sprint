require 'rails_helper'

RSpec.describe User, type: :model do
  it "must have a username and password" do
    result = User.create(username: "test")
    expect(result).to_not be_valid
  end
end
