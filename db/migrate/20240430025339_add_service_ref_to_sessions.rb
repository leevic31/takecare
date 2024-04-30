class AddServiceRefToSessions < ActiveRecord::Migration[7.1]
  def change
    add_reference :sessions, :service, null: false, foreign_key: true
  end
end
