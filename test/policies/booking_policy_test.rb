require 'test_helper'

class BookingPolicyTest < ActiveSupport::TestCase
  setup do
    @admin_role = FactoryBot.create(:role, :admin)
    @admin_user = FactoryBot.create(:user)
    @admin_user.add_role(@admin_role.name)

    @staff_member_role = FactoryBot.create(:role, :staff_member)
    @staff_member_user = FactoryBot.create(:user)
    @staff_member_user.add_role(@staff_member_role.name)

    @client_role = FactoryBot.create(:role, :client)
    @client_user = FactoryBot.create(:user)
    @client_user.add_role(@client_role.name)
  end

  test "admin can manage all bookings" do
    booking_policy = BookingPolicy.new(@admin_user, Booking)
    
    assert booking_policy.index?
    assert booking_policy.create?
    assert booking_policy.update?
    assert booking_policy.destroy?
  end
end
