class DropAvailablityBlocks < ActiveRecord::Migration[7.1]
  def change
    drop_table :availablity_blocks
  end
end
