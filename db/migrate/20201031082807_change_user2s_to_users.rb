class ChangeUser2sToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_table :user2s, :users
  end
end
