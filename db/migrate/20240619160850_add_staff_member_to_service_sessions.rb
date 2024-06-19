class AddStaffMemberToServiceSessions < ActiveRecord::Migration[7.1]
  def change
    add_reference :service_sessions, :staff_member, null: false, foreign_key: true
  end
end
