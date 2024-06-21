require "test_helper"

class ServicesControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers

  setup do
    @user, @token = sign_in_as(users(:lazaro_nixon))
    @service = services(:one)
    @organization = organizations(:one)
    @service_with_no_service_sessions = services(:two)
  end
  
  def default_headers
    { "Authorization" => "Bearer #{@token}" }
  end

  test "should get index" do
    get organization_services_url(
      organization_id: @service.organization
    ),
    headers: default_headers

    assert_response :success
  end

  test "should create service" do
    assert_difference("Service.count") do
      post organization_services_url(
        organization_id: @service.organization
      ),
      params: {
        service: {
          service_type: "massage",
          organization: @organization
        },
      },
      headers: default_headers
    end

    assert_response 204
  end

  test "should update service" do
    updated_service_type = "accupuncture"
    patch organization_service_url(
      id: @service.id,
      organization_id: @service.organization
    ),
    params: {
      service: {
        service_type: updated_service_type
      }
    },
    headers: default_headers

    @service.reload
    assert_equal updated_service_type, @service.service_type
  end

  test "should delete service" do
    assert_difference("Service.count", -1) do
      delete organization_service_url(
        id: @service.id,
        organization_id: @service.organization
      ),
      headers: default_headers
    end
    assert_response 204
  end

  test "service has no associated service sessions" do
    assert_empty @service_with_no_service_sessions.service_sessions
  end

  test "service has associated service sessions" do
    assert_equal 1, @service.service_sessions.count
  end
end
