class AddAvailabilityBlockAndUserToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :availability_block, null: false, foreign_key: true
    add_reference :bookings, :user, null: false, foreign_key: true
  end
end
