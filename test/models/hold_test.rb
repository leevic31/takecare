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

  test "should cancel related jobs when Hold is destroyed" do
    booking = FactoryBot.create(:booking)
    hold = FactoryBot.create(:hold)
    job = HoldDestroyJob.set(wait: 1.hour).perform_later(hold)

    assert_equal 1, Delayed::Job.count
    
    hold.destroy

    assert_equal 0, Delayed::Job.count, "Job was not cancelled"
  end
end
