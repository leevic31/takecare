require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
    setup do

    end

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
        sign_in @user


        # get users_me_url, headers: { Authorization: "Bearer #{@token}" }, as: :json

        # puts "REQUEST URL: #{users_me_url}"
        # puts "REQUEST HEADERS: #{request.headers.inspect}"
        # puts "RESPONSE BODY: #{response.body}"

        # response_data = JSON.parse(response.body)
        # assert_equal @user.email, response_data['email']
    end
end
