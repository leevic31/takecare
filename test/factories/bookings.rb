FactoryBot.define do
    factory :booking do
        association :user
        association :availability_block
        available { true }
        start_time { Faker::Time.between_dates(from: Date.today, to: Date.today + 1, period: :morning) }
        end_time { Faker::Time.between_dates(from: Date.today, to: Date.today + 1, period: :afternoon) }
    end
end
