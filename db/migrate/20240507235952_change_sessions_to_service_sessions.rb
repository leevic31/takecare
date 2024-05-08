class ChangeSessionsToServiceSessions < ActiveRecord::Migration[7.1]
  def change
    rename_table :Sessions, :ServiceSessions
  end
end
