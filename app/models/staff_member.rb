class StaffMember < ApplicationRecord
    validates :name, presence: true
end
