class SetDefaultAvailabilityToBookings < ActiveRecord::Migration[7.1]
  def change
    change_column_default :bookings, :available, true
  end
end
