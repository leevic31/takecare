class ChangeDurationsInServices < ActiveRecord::Migration[7.1]
  def change
    change_column :services, :durations, :text
  end
end
