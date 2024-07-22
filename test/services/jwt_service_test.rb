require 'test_helper'

class JwtServiceTest < ActiveSupport::TestCase
    test "encode token" do
        payload = { user_id: 1 }
        token = JwtService.encode_token(payload)
        decoded_payload = JwtService.decode_token(token)
        assert_equal payload[:user_id], decoded_payload.first['user_id']
    end
end
