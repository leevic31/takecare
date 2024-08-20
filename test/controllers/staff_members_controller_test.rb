require "test_helper"

class StaffMembersControllerTest < ActionDispatch::IntegrationTest
  test "should create a staff member" do
    post staff_members_url,
      params: {
        user: {
          email: 'test@example.com',
          password: 'password',
          password_confirmation: 'password',
          first_name: "bob",
          last_name: "smith"
        }
      },
      as: :json

    assert_response :created 
  end
end

