require 'test_helper'

class ServiceSessionPolicyTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

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

  test "admin can create service session" do
    assert ServiceSessionPolicy.new(@admin_user, ServiceSession).create?
  end

  test "admin can update service session" do
    assert ServiceSessionPolicy.new(@admin_user, ServiceSession).update?
  end

  test "admin can destroy service session" do
    assert ServiceSessionPolicy.new(@admin_user, ServiceSession).destroy?
  end

  test "staff member can not create service session" do
    refute ServiceSessionPolicy.new(@staff_member_user, ServiceSession).create?
  end

  test "staff member can not update service session" do
    refute ServiceSessionPolicy.new(@staff_member_user, ServiceSession).update?
  end

  test "staff member can not destroy service session" do
    refute ServiceSessionPolicy.new(@staff_member_user, ServiceSession).destroy?
  end

  test "client can not create service session" do
    refute ServiceSessionPolicy.new(@client_user, ServiceSession).create?
  end

  test "client can not update service session" do
    refute ServiceSessionPolicy.new(@client_user, ServiceSession).update?
  end

  test "client can not destroy service session" do
    refute ServiceSessionPolicy.new(@client_user, ServiceSession).destroy?
  end
end
