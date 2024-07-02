class Hold < ApplicationRecord
  validates :expires_at, presence: true
  belongs_to :booking
end
