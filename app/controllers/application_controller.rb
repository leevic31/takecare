class ApplicationController < ActionController::API
  include Pundit::Authorization

  before_action :authenticate_user!, except: [:create]
  
  def current_user
    return unless token_payload

    @current_user ||= User.find(token_payload['user_id'])
  end

  def encode_token(payload)
    payload.reverse_merge!(exp: 15.minutes.from_now.to_i)
    JWT.encode(payload, jwt_secret_key, 'HS256')
  end

  def decode_token(token)
    decoded = JWT.decode(token, jwt_secret_key, true, { algorithm: 'HS256' })
    decoded_payload = decoded.first

    if Time.at(decoded_payload['exp']) < Time.now
      raise JWT::ExpiredSignature, 'Signature has expired'
    end
  
    decoded_payload
  rescue JWT::ExpiredSignature => e
    nil
  rescue JWT::DecodeError => e
    nil
  end

  private

  def jwt_secret_key
    Rails.application.credentials.jwt_secret_key
  end

  def token_payload
    token = request.headers['Authorization']&.split(' ')&.last
    return unless token

    decode_token(token)
  end

  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    begin
      decoded_token = JWT.decode(token, Rails.application.credentials.jwt_secret_key, true, algorithm: 'HS256')
      @current_user = User.find(decoded_token[0]['user_id'])
    rescue
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
