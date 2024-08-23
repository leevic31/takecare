class AddServiceRefToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :service, null: false, foreign_key: true
  end
end
