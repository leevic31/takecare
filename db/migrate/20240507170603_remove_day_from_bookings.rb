class RemoveDayFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_reference :bookings, :day, null: false, foreign_key: true
  end
end
