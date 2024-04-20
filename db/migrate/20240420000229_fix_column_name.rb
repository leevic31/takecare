class FixColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :services, :type, :service
  end
end
