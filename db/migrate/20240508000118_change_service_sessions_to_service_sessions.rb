class ChangeServiceSessionsToServiceSessions < ActiveRecord::Migration[7.1]
  def change
    rename_table :ServiceSessions, :service_sessions
  end
end
