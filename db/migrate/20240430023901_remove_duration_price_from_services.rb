class RemoveDurationPriceFromServices < ActiveRecord::Migration[7.1]
  def change
    remove_column :services, :duration, :integer
    remove_column :services, :price, :decimal
  end
end
