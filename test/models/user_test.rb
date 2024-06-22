require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
        @user = build(:user)
    end

    test "should be valid with valid attributes" do
        assert @user.valid?, "User is not valid: #{@user.errors.inspect}"
    end

    test "should not be valid without an email" do
        user = build(:user, email: nil)
        assert_not user.valid?, "Saved user without an email"
        assert_includes user.errors[:email], "can't be blank"
    end

    test "email should be unique" do
        existing_user = create(:user)
        user = build(:user, email: existing_user.email)
        assert_not user.valid?, "Saved user with duplicate email"
        assert_includes user.errors[:email], "has already been taken"
    end

    test "should not be valid without a role" do
        user = build(:user, role: nil)
        assert_not user.valid?, "Saved user without a role"
        assert_includes user.errors[:role], "must exist"
    end

    test "should not be valid with a password less than 12 characters" do
        @user.password_digest = nil
        @user.password = "a" * 8
        assert_not @user.valid?, "Saved user with password that is too short"
    end

    test "should have a role" do
        assert @user.role.present?
    end

    test "should belong to the correct role" do
        @client_role = build(:role, :client)
        @admin_role = build(:role, :admin)
        @staff_member = build(:role, :staff_member)

        @client_user = build(:user, role: @client_role)
        @admin_user = build(:user, role: @admin_role)
        @staff_member_user = build(:user, role: @staff_member)

        assert_equal "admin", @admin_user.role.name
        assert_equal "client", @client_user.role.name
        assert_equal "staff member", @staff_member_user.role.name

    end
end
