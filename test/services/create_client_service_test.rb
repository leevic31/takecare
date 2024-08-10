require 'test_helper'

class CreateClientServiceTest < ActiveSupport::TestCase
  test "should create user and assign role" do
    service = CreateClientService.new(
      user_params: {
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    )
    user = service.call
    
    assert_instance_of User, user
    assert user.persisted?
    assert user.has_role?(:client)
  end
end
