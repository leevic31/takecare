FactoryBot.define do
    factory :service_session do
        association :service
        association :user

        title { "my service session" }
    end
end
