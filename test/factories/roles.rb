FactoryBot.define do
  factory :role do
    sequence(:name) { |n| "Role #{n}"}

    trait :admin do
      name { "admin" }
    end

    trait :staff_member do
      name { "staff_member" }
    end

    trait :client do
      name { "client" }
    end
  end
end
