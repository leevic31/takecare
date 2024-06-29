require 'test_helper'

class SessionsTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, email: "test@example.com", password: "password")
  end

  test "valid sign in returns JWT token" do
    post '/auth/sign_in', params: {
      email: @user.email,
      password: "password"
    }

    assert_response :success
    assert_match /"token":"(.+?)"/, response.body
  end

  test "invalid sign in returns unauthorized" do
    post '/auth/sign_in', params: {
      email: @user.email,
      password: "wrong_password"
    }

    assert_response :unauthorized
    assert_nil response.headers['Authorization']
  end
end
