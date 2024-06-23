class CreateHolds < ActiveRecord::Migration[7.1]
  def change
    create_table :holds do |t|
      t.references :booking, null: false, foreign_key: true
      t.datetime :expires_at

      t.timestamps
    end
  end
end
