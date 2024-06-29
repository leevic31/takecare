class SessionsController < Devise::SessionsController
    respond_to :json

    def create
        user = User.find_by(email: params[:email])

        if user&.valid_password?(params[:password])
            render json: { token: JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base) }
        else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end
end
