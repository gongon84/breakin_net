class ChangeUsersToComments < ActiveRecord::Migration[6.0]
  def change
    rename_table :users, :comments
  end
end
