FactoryBot.define do
    factory :role do
        name { "admin" }
          
        trait :admin do
            name { "admin" }
        end

        trait :client do
            name { "client" }
        end

        trait :staff_member do
            name { "staff member" }
        end
    end
end
