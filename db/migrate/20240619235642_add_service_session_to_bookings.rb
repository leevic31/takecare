class AddServiceSessionToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :service_session, null: false, foreign_key: true
  end
end
