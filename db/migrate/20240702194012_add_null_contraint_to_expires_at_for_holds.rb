class AddNullContraintToExpiresAtForHolds < ActiveRecord::Migration[7.1]
  def change
    change_column :holds, :expires_at, :datetime, null: false
  end
end
