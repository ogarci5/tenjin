class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :token
    remove_column :users, :password_digest
  end
end
