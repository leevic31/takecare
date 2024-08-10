require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should create a client" do
    post clients_url,
      params: {
        user: {
          email: 'test@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
      },
      as: :json

    assert_response :created 
  end
end
