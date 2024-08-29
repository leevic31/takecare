require "test_helper"

class ServiceTest < ActiveSupport::TestCase
  setup do
    @service = FactoryBot.create(:service)
  end

  test "should be valid with all attributes" do
    assert @service.valid?
  end

  test "should require service_type" do
    @service.service_type = nil
    refute @service.valid?
    assert_not_nil @service.errors[:service_type]
  end

  test "should validate durations are positive numbers" do
    @service.durations = ["-30", "60"]
    refute @service.valid?
    assert_not_nil @service.errors[:durations]
  end

  test "should accept valid durations" do
    @service.durations = ["30", "60"]
    assert @service.valid?
  end

  test "should belong to organization" do
    assert_respond_to @service, :organization
  end

  test "should have many bookings" do
    assert_respond_to @service, :bookings
  end

  test "should have many availability_blocks" do
    assert_respond_to @service, :availability_blocks
  end

  test "should serialize durations as JSON" do
    @service.save
    assert_equal ["30", "60", "90"], Service.find(@service.id).durations
  end
end
