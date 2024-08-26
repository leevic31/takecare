FactoryBot.define do
  factory :availability_block do
    association :user
    association :service
    start_time { Time.current.beginning_of_day + 9.hours }
    end_time { Time.current.beginning_of_day + 17.hours }
  end
end
