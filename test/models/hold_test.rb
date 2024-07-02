require "test_helper"

class HoldTest < ActiveSupport::TestCase
  test "hold is destroyed after expiry" do
    travel_to Time.zone.now do
      booking = FactoryBot.create(:booking)
      hold = Hold.create(booking: booking)
      travel 6.minutes
      HoldDestroyJob.perform_now(hold)

      assert_not Hold.exists?(hold.id), "Hold should have been destroyed after expiry"
    end
  end
end
