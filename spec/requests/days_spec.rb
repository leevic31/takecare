require 'rails_helper'

RSpec.describe "Days", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/days/index"
      expect(response).to have_http_status(:success)
    end
  end

end
