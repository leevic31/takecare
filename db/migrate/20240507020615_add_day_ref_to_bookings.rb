class AddDayRefToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :day, null: false, foreign_key: true
  end
end
