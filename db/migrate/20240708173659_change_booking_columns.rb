class ChangeBookingColumns < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :start_time, :datetime
    change_column :bookings, :end_time, :datetime
    remove_column :bookings, :date, :date
  end
end
