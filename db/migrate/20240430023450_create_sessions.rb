class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.string :title
      t.text :description
      t.integer :duration
      t.decimal :price

      t.timestamps
    end
  end
end
