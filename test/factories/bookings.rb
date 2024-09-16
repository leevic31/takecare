FactoryBot.define do
    factory :booking do
        association :staff_member, factory: :user
        association :availability_block
        association :service
        available { true }
    
        trait :morning do
            start_time { "2024-09-16 09:00:00" }
            end_time { "2024-09-16 10:00:00" }
        end

        trait :afternoon do
            start_time { "2024-09-16 14:00:00" }
            end_time { "2024-09-16 15:00:00" }
        end

        trait :evening do
            start_time { "2024-09-16 18:00:00" }
            end_time { "2024-09-16 19:00:00" }
        end

        trait :unavailable do
            available { false }
        end
    end
end
