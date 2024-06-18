require "test_helper"

class StaffMembersControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  
  setup do
    @user, @token = sign_in_as(users(:lazaro_nixon))
    @staff_member = staff_members(:one)
  end

  def default_headers
    { "Authorization" => "Bearer #{@token}" }
  end

  test "should get index" do
    get staff_members_url, headers: default_headers
    assert_response :success
  end

  test "should create staff member" do
    assert_difference("StaffMember.count") do
      post staff_members_url, params: {
        staff_member: {
          name: "Bob"
        },
      },
      headers: default_headers

      assert_response 204
    end
  end

  test "should update staff member" do
    updated_name = "Alice"

    patch staff_member_url(@staff_member),
      params: {
        staff_member: {
          name: updated_name
        }
      },
      headers: default_headers

    @staff_member.reload

    assert_equal updated_name, @staff_member.name
  end

  test "should delete staff member" do
    assert_difference("StaffMember.count", -1) do
      delete staff_member_url(@staff_member), headers: default_headers
    end

    assert_response 204
  end
end
