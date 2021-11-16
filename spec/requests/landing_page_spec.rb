require 'rails_helper'

RSpec.describe "LandingPages", type: :request do
  describe "GET /landing_page" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

end
