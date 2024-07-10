class CreateAvailabilityBlocks < ActiveRecord::Migration[7.1]
  def change
    create_table :availability_blocks do |t|
      t.references :staff, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
