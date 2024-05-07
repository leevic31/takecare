class ChangeStartAndEndTimeInBookings < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :start_time, :time
    change_column :bookings, :end_time, :time
  end
end
