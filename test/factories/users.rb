FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        verified { true }
        association :role

        transient do
            password_digest { BCrypt::Password.create(password) }
        end

        after(:build) do |user, evaluator|
            user.password_digest = evaluator.password_digest
        end 
    end
end
