require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /sign-up" do
    it "returns http success" do
      get "/sign-up"
      expect(response).to have_http_status(:success)
    end
  end
end
