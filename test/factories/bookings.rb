FactoryBot.define do
    factory :booking do
        association :client, factory: :user
        association :staff_member, factory: :user
        association :availability_block
        association :service
        available { true }
        start_time { Faker::Time.between_dates(from: Date.today, to: Date.today + 1, period: :morning) }
        end_time { Faker::Time.between_dates(from: Date.today, to: Date.today + 1, period: :afternoon) }
    end
end
