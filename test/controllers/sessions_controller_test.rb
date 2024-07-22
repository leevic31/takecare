require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
    setup do
        @user = FactoryBot.create(:user)
    end

    test "should login user and return token" do
        post login_url, params: { email: @user.email, password: 'password' }, as: :json
        assert_response :success

        token = JSON.parse(response.body)
        assert_not_nil token
    end

    test "should handle invalid login attempt" do
        post login_url, params: { email: @user.email, password: 'wrong_password' }, as: :json
        assert_response :unauthorized

        error = JSON.parse(response.body)['error']
        assert_equal 'Invalid email or password', error
    end
end
