require 'test_helper'

class BookingPolicyTest < ActiveSupport::TestCase
  def setup
    @client_role = build(:role, :client)
    @admin_role = build(:role, :admin)
    @staff_member = build(:role, :staff_member)

    @client_user = build(:user, role: @client_role)
    @admin_user = build(:user, role: @admin_role)
    @staff_member_user = build(:user, role: @staff_member)
  end

  test "admin can manage all bookings" do
    booking_policy = BookingPolicy.new(@admin_user, Booking)
    
    assert booking_policy.index?
    assert booking_policy.create?
    assert booking_policy.update?
    assert booking_policy.destroy?
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
