class RemoveStaffReferenceFromAvailabilityBlocks < ActiveRecord::Migration[7.1]
  def change
    remove_reference :availability_blocks, :staff, null: false, foreign_key: true
  end
end
