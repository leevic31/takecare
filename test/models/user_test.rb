require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
  end

  test "should be valid" do
    assert @user.valid?
  end
end
