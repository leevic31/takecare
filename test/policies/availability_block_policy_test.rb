require 'test_helper'

class AvailabilityBlockPolicyTest < ActiveSupport::TestCase
  setup do
    @staff_member_role = FactoryBot.create(:role, :staff_member)
    @staff_member_user = FactoryBot.create(:user)
    @staff_member_user.add_role(@staff_member_role.name)
  end

  test "staff member can create an availability block" do
    availability_block_policy = AvailabilityBlockPolicy.new(@staff_member_user, AvailabilityBlock)

    assert availability_block_policy.create?
  end
  
  # def test_scope
  # end

  # def test_show
  # end

  # def test_create
  # end

  # def test_update
  # end

  # def test_destroy
  # end
end
