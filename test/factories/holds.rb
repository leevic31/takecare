FactoryBot.define do
  factory :hold do
    association :booking
    expires_at { 5.minutes.from_now }
  end
end
