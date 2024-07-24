ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require 'factory_bot'

module AuthHelper
  def encode_token(payload)
    payload.reverse_merge!(exp: 15.minutes.from_now.to_i)
    JWT.encode(payload, Rails.application.credentials.jwt_secret_key, 'HS256')
  end

  def auth_headers(user)
    {
      'Authorization' => "Bearer #{encode_token(user_id: user.id)}",
      'Content-Type' => 'application/json'
    }
  end
end

class ActiveSupport::TestCase
  include AuthHelper
  include FactoryBot::Syntax::Methods
  FactoryBot.reload

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

