require "test_helper"

class ServiceSessionsControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers

  setup do
    @user, @token = sign_in_as(users(:lazaro_nixon))
    @service = services(:one)
    @service_session = service_sessions(:one)
  end
  
  def default_headers
    { "Authorization" => "Bearer #{@token}" }
  end

  test "should get index" do
    get organization_service_service_sessions_url(
      service_id: @service,
      organization_id: @service.organization
    ), 
    headers: default_headers

    assert_response :success
  end

  test "should create service session" do
    assert_difference("ServiceSession.count") do
      post organization_service_service_sessions_url(
        service_id: @service,
        organization_id: @service.organization
      ),
      params: {
        service_session: {
          title: "title",
          description: "description",
          duration: 1,
          price: 9.99,
          service: @service
        },
      },
      headers: default_headers
    end
    assert_response :created
  end

  test "should not create service session with invalid data" do
    invalid_service_session_params = {
      description: "description",
      duration: 1,
      price: 9.99,
      service: @service
    }
    assert_no_difference "ServiceSession.count" do
      post organization_service_service_sessions_url(
        service_id: @service,
        organization_id: @service.organization
      ),
      params: {
        service_session: invalid_service_session_params
      },
      headers: default_headers
    end
    assert_response :unprocessable_entity
  end

  test "should update service session" do
    updated_title = "new title"
    updated_description = "new description"
    updated_duration = 2
    updated_price = 10.99
    patch organization_service_service_session_url(
      id: @service_session.id, 
      service_id: @service,
      organization_id: @service.organization
      ),
      params: {
        service_session: {
          title: updated_title,
          description: updated_description,
          duration: updated_duration,
          price: updated_price
        }
      },
      headers: default_headers
    @service_session.reload
    assert_equal updated_title, @service_session.title
    assert_equal updated_description, @service_session.description
    assert_equal updated_duration, @service_session.duration
    assert_equal updated_price, @service_session.price
  end

  test "should not update service session with invalid data" do
    invalid_service_session_params = { title: nil }
    patch organization_service_service_session_url(
      id: @service_session.id, 
      service_id: @service,
      organization_id: @service.organization
      ),
      params: { service_session: invalid_service_session_params },
      headers: default_headers
    assert_response :unprocessable_entity
  end

  test "should delete service session" do
    assert_difference("ServiceSession.count", -1) do
      delete organization_service_service_session_url(
        id: @service_session.id, 
        service_id: @service,
        organization_id: @service.organization
      ),
      headers: default_headers
    end
    assert_response 204
  end
end
