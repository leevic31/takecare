FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { 'password' }
    first_name { 'bob' }
    last_name { 'smith' }
  end
end
