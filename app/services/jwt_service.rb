class JwtService
    def self.encode_token(payload)
        JWT.encode(payload, jwt_secret_key, 'HS256')
    end

    def self.decode_token(token)
        JWT.decode(token, jwt_secret_key, true, { algorithm: 'HS256' })
    rescue JWT::DecodeError
        nil
    end

    private

    def self.jwt_secret_key
        Rails.application.credentials.jwt_secret_key
    end
end
