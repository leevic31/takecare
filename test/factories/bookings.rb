FactoryBot.define do
    factory :booking do
        association :service_session
        
        start_time { Faker::Time.between_dates(from: Date.today, to: Date.today + 1, period: :morning) }
        end_time { Faker::Time.between_dates(from: Date.today, to: Date.today + 1, period: :afternoon) }
        date { Faker::Date.between(from: Date.today, to: Date.today + 1) }
    end
end
