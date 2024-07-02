require "test_helper"

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @organization = FactoryBot.create(:organization)
    @admin_role = FactoryBot.create(:role, :admin)
    @admin_user = FactoryBot.create(:user)
    @admin_user.add_role(@admin_role.name)
  end

  test "admin should get index" do
    sign_in @admin_user
    get organizations_url, as: :json
    assert_response :success
  end
end
