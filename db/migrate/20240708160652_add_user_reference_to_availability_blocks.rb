class AddUserReferenceToAvailabilityBlocks < ActiveRecord::Migration[7.1]
  def change
    add_reference :availability_blocks, :user, null: false, foreign_key: true
  end
end
