class FixColumnNameService < ActiveRecord::Migration[7.1]
  def change
    rename_column :services, :service, :service_type
  end
end
