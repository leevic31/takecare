class DropStaffMembers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :service_sessions, :staff_member, foreign_key: true
    drop_table :staff_members
  end
end
