require "rails_helper"

RSpec.describe "OrganizationsController", type: :request do
    describe "GET /organizations" do
        it "gets Organizations" do
            get organizations_path
            expect(response).to have_http_status(:ok)
        end
    end
end
