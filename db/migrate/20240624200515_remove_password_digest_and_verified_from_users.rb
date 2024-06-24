class RemovePasswordDigestAndVerifiedFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :password_digest, :string
    remove_column :users, :verified, :boolean, default: false
  end
end
