FactoryBot.define do
    factory :service do
        association :organization

        service_type { "my service" }
    end
end
