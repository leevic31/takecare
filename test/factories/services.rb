FactoryBot.define do
    factory :service do
        association :organization
        service_type { "my service" }
        durations { ["30", "60", "90"] }
    end
end
