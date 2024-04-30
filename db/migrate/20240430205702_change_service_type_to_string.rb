class ChangeServiceTypeToString < ActiveRecord::Migration[7.1]
  def change
    change_column :services, :service_type, :string
  end
end
