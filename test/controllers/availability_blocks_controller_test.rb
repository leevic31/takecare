require "test_helper"

class AvailabilityBlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service = FactoryBot.create(:service)
    @staff_member_role = FactoryBot.create(:role, :staff_member)
    @staff_member_user = FactoryBot.create(:user)
    @staff_member_user.add_role(@staff_member_role.name)
  end

  test "should create availability blcok" do
    assert_difference("AvailabilityBlock.count") do
      post availability_blocks_url, 
      params: {
        availability_block: {
          start_time: DateTime.now,
          end_time: DateTime.now + 5.hours,
          user_id: @staff_member_user.id,
          service_id: @service.id
        },
      },
      as: :json
    end

    assert_response :created
  end
end
