require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should assign admin role to a newly created User" do
    user = User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password')
    
    assert user.has_role?(:admin)
  end
end
