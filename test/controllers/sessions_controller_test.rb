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

    test "should reject request with expired token" do
        token = ApplicationController.new.encode_token({ user_id: @user.id, exp: 1.minute.ago.to_i })
        get users_me_url, headers: { Authorization: "Bearer #{token}" }, as: :json

        assert_response :unauthorized
    end

    test "should set token expiry correctly" do
        token = ApplicationController.new.encode_token({ user_id: @user.id })
        decoded_payload = ApplicationController.new.decode_token(token)
      
        assert_not_nil decoded_payload['exp']
        assert Time.at(decoded_payload['exp']) > Time.now
    end
end
