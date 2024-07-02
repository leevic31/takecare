require "test_helper"

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @organization = FactoryBot.create(:organization)

    @admin_role = FactoryBot.create(:role, :admin)
    @admin_user = FactoryBot.create(:user)
    @admin_user.add_role(@admin_role.name)

    @client_role = FactoryBot.create(:role, :client)
    @client_user = FactoryBot.create(:user)
    @client_user.add_role(@client_role.name)
  end

  test "admin should get index" do
    sign_in @admin_user
    get organizations_url, as: :json
    assert_response :success
  end

  test "client should not get index" do
    sign_in @client_user
    assert_raises Pundit::NotAuthorizedError do
      get organizations_url, as: :json
    end
  end

  test "admin should create organization" do
    sign_in @admin_user

    assert_difference("Organization.count") do
      post organizations_url,
      params: {
        organization: {
          name: "test org"
        },
      },
      as: :json
    end

    assert_response :created
  end

  test "should not create organization with invalid data" do
    sign_in @admin_user

    invalid_organization_params = {
      invalid_name: 123
    }

    assert_no_difference "Organization.count" do
      post organizations_url,
        params: { organization: invalid_organization_params },
        as: :json

      assert_response :unprocessable_entity
    end
  end

  test "admin should update organization" do
    sign_in @admin_user

    updated_name = "new org name"

    patch organization_url(@organization),
      params: {
        organization: {
          name: updated_name
        }
      },
      as: :json
    @organization.reload

    assert_equal updated_name, @organization.name
  end

  test "should not update organization with invalid data" do
    sign_in @admin_user

    invalid_name = nil

    patch organization_url(@organization),
      params: {
        organization: { name: invalid_name }
      },
      as: :json

    assert_response :unprocessable_entity
  end

  test "admin should delete organization" do
    sign_in @admin_user
    
    assert_difference("Organization.count", -1) do
      delete organization_url(@organization),
      as: :json
    end

    assert_response 204
  end
end
