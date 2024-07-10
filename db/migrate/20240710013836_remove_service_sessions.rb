class RemoveServiceSessions < ActiveRecord::Migration[7.1]
  def change
    drop_table :service_sessions
  end
end
