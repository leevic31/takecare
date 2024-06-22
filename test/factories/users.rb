FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        password { Faker::Internet.password(min_length: password_length) }
        verified { true }
        association :role
        
        transient do
            password_length { 12 }
        end
        
        after(:build) do |user, evaluator|
            user.password = evaluator.password
        end
    end
end
