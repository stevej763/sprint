require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /sign-in" do
    it "returns http success" do
      get "/sign-in"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /homepage" do
    it "returns http redirect when not logged in" do
      get "/homepage"
      expect(response).to have_http_status(:redirect)
    end
  end

end
