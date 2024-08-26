class SessionsController < ApplicationController
    # LOGIN
    def create
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            token = encode_token(user_id: user.id)
            render json: { token: token }
        else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end

    def destroy
        # No action needed for JWT (stateless)
        head :no_content
    end
end
