require 'test_helper'

class ServicePolicyTest < ActiveSupport::TestCase
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

  test "admin can create service" do
    assert ServicePolicy.new(@admin_user, Service).create?
  end

  test "admin can update service" do
    assert ServicePolicy.new(@admin_user, Service).update?
  end

  test "admin can destroy service" do
    assert ServicePolicy.new(@admin_user, Service).destroy?
  end

  test "staff member can not create service" do
    refute ServicePolicy.new(@staff_member_user, Service).create?
  end

  test "staff member can not update service" do
    refute ServicePolicy.new(@staff_member_user, Service).update?
  end

  test "staff member can not destroy service" do
    refute ServicePolicy.new(@staff_member_user, Service).destroy?
  end

  test "client can not create service" do
    refute ServicePolicy.new(@client_user, Service).create?
  end

  test "client can not update service" do
    refute ServicePolicy.new(@client_user, Service).update?
  end

  test "client can not destroy service" do
    refute ServicePolicy.new(@client_user, Service).destroy?
  end
end
