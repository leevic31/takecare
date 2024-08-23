require "test_helper"

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = FactoryBot.create(:organization)

    @admin_role = FactoryBot.create(:role, :admin)
    @admin_user = FactoryBot.create(:user)
    @admin_user.add_role(@admin_role.name)
  end

  test "should get index" do
    get organizations_url, headers: auth_headers(@admin_user), as: :json
    assert_response :success
  end

  test "should create organization" do
    assert_difference("Organization.count") do
      post organizations_url,
      headers: auth_headers(@admin_user),
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
    invalid_organization_params = {
      invalid_name: 123
    }

    assert_no_difference "Organization.count" do
      post organizations_url,
        params: { organization: invalid_organization_params },
        headers: auth_headers(@admin_user),
        as: :json

      assert_response :unprocessable_entity
    end
  end

  test "admin should update organization" do
    updated_name = "new org name"

    patch organization_url(@organization),
      params: {
        organization: {
          name: updated_name
        }
      },
      headers: auth_headers(@admin_user),
      as: :json
    @organization.reload

    assert_equal updated_name, @organization.name
  end

  test "should not update organization with invalid data" do
    invalid_name = nil

    patch organization_url(@organization),
      params: {
        organization: { name: invalid_name }
      },
      headers: auth_headers(@admin_user),
      as: :json

    assert_response :unprocessable_entity
  end

  test "should delete organization" do    
    assert_difference("Organization.count", -1) do
      delete organization_url(@organization),
      headers: auth_headers(@admin_user),
      as: :json
    end

    assert_response 204
  end
end
