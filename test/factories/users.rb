FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        password { "Secret1*3*5*" }
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
