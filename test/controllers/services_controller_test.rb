require "test_helper"

class ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service = FactoryBot.create(:service)

    @admin_role = FactoryBot.create(:role, :admin)
    @admin_user = FactoryBot.create(:user)
    @admin_user.add_role(@admin_role.name)
  end

  test "should get index" do
    get organization_services_url(
      organization_id: @service.organization,
      id: @service.id
    ), 
    headers: auth_headers(@admin_user), 
    as: :json

    assert_response :success
  end

  test "should create service" do
    assert_difference("Service.count") do
      post organization_services_url(organization_id: @service.organization),
      headers: auth_headers(@admin_user),
      params: {
        service: {
          service_type: "massage",
          organization: @organization,
          durations: ["60"]
        },
      },
      as: :json
    end

    assert_response :created
  end

  test "should update service" do
    updated_service_type = "accupuncture"
    patch organization_service_url(
      id: @service.id,
      organization_id: @service.organization
    ),
    headers: auth_headers(@admin_user),
    params: {
      service: {
        service_type: updated_service_type
      }
    },
    as: :json

    @service.reload

    assert_equal updated_service_type, @service.service_type
  end

  test "should delete service" do
    assert_difference("Service.count", -1) do
      delete organization_service_url(
        id: @service.id,
        organization_id: @service.organization
      ),
      headers: auth_headers(@admin_user),
      as: :json
    end

    assert_response 204
  end
end
