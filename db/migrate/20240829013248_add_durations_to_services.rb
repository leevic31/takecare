class AddDurationsToServices < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :durations, :text, array: true, default: []
  end
end
