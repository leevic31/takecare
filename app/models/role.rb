class Role < ApplicationRecord
    belongs_to :user

    enum role: [:client, :admin, :staff_member]
end
