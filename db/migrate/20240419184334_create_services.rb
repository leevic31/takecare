class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.integer :type
      t.integer :duration
      t.decimal :price

      t.timestamps
    end
  end
end
