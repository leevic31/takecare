class UsersController < ApplicationController    
    def create
        @user = User.new(user_params)

        if @user.save
            render json: { 
                token: JWT.encode({ user_id: @user.id }, 
                    Rails.application.credentials.devise_jwt_secret_key) 
            }, 
            status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def me
        render json: current_user
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
