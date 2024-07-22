require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
    test "should create user" do
        assert_difference("User.count") do
            post users_url, 
            params: { 
                user: {
                    email: 'test@example.com',
                    password: 'password',
                    password_confirmation: 'password'
                }  
            }, 
            as: :json
        end
        assert_response :created
    end

    test "should get current user info when authenticated" do
        @user = FactoryBot.create(:user)
        @token = ApplicationController.new.encode_token(user_id: @user.id)

        get users_me_url, headers: { Authorization: "Bearer #{@token}" }, as: :json

        response_data = JSON.parse(response.body)
        assert_equal @user.email, response_data['email']
    end
end
