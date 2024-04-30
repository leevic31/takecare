class Session < ApplicationRecord
    belongs_to :service
    validates :title, presence: true
end
