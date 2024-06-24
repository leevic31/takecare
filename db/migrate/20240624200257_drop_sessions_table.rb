class DropSessionsTable < ActiveRecord::Migration[7.1]
  def change
    def up
      drop_table :sessions
    end
  
    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
