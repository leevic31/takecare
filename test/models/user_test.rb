require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "should be valid with valid attributes" do
        user = build(:user)
        assert user.valid?, "User is not valid: #{user.errors.inspect}"
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
        user = create(:user, password: 'password', password_confirmation: 'password')
        # user = build(:user, :short_password)
        assert_not user.valid?, "Saved user with password that is too short"
        assert_includes user.errors[:password], "is too short (minimum is 12 characters)"
    end

    # test "should authenticate with correct password" do
    #     user = create(:user, password: 'password', password_confirmation: 'password')
    #     assert user.authenticate('password'), "User did not authenticate with correct password"
    # end
    
    # test "should not authenticate with incorrect password" do
    #     user = create(:user, password: 'password', password_confirmation: 'password')
    #     assert_not user.authenticate('wrongpassword'), "User authenticated with incorrect password"
    # end
end
