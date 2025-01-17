class CreateAvailablityBlocks < ActiveRecord::Migration[7.1]
  def change
    create_table :availablity_blocks do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
