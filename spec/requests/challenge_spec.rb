require 'rails_helper'

RSpec.describe "Challenges", type: :request do
  describe "GET /challenge" do
    it "returns http success" do
      get "/challenge/challenge"
      expect(response).to have_http_status(:success)
    end
  end

end
