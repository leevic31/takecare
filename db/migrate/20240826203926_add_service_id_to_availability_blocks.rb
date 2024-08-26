class AddServiceIdToAvailabilityBlocks < ActiveRecord::Migration[7.1]
  def change
    add_reference :availability_blocks, :service, null: false, foreign_key: true
  end
end
