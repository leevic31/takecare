class AddClientAndStaffMemberToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :client, foreign_key: { to_table: :users }
    add_reference :bookings, :staff_member, foreign_key: { to_table: :users } 
  end
end
