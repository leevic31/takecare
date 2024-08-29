class ChangeStaffMemberIdInBookings < ActiveRecord::Migration[7.1]
  def change
    change_column_null :bookings, :staff_member_id, false
  end
end
