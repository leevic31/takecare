class UsersController < ApplicationController
    # SIGN UP
    def create
        user = User.new(user_params)

        if user.save
            token = encode_token(user_id: user.id)
            render json: { token: token }, status: :created
        else
            render json: user.errors, status: :unprocessable_entity
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
