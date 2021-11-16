require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it "returns http success" do
      get "/sessions/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /homepage" do
    it "returns http success" do
      get "/sessions/homepage"
      expect(response).to have_http_status(:success)
    end
  end

end
