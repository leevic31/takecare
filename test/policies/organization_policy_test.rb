require 'test_helper'

class OrganizationPolicyTest < ActiveSupport::TestCase
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

  test "admin can see their own organizations" do
  end

  test "admin can get index" do
    assert OrganizationPolicy.new(@admin_user, Organization).index?
  end

  test "admin can create organization" do
    assert OrganizationPolicy.new(@admin_user, Organization).create?
  end

  test "admin can update organization" do
    assert OrganizationPolicy.new(@admin_user, Organization).update?
  end

  test "admin can destroy organization" do
    assert OrganizationPolicy.new(@admin_user, Organization).destroy?
  end

  test "staff member can not get index" do
    refute OrganizationPolicy.new(@staff_member_user, Organization).index?
  end

  test "staff member can not create organization" do
    refute OrganizationPolicy.new(@staff_member_user, Organization).create?
  end

  test "staff member can not update organization" do
    refute OrganizationPolicy.new(@staff_member_user, Organization).update?
  end

  test "staff member can not destroy organization" do
    refute OrganizationPolicy.new(@staff_member_user, Organization).destroy?
  end

  test "client can not get index" do
    refute OrganizationPolicy.new(@client_user, Organization).index?
  end
  
  test "client can not create organization" do
    refute OrganizationPolicy.new(@client_user, Organization).create?
  end

  test "client can not update organization" do
    refute OrganizationPolicy.new(@client_user, Organization).update?
  end

  test "client can not destroy organization" do
    refute OrganizationPolicy.new(@client_user, Organization).destroy?
  end
end
