class RemoveImageNameToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :image_name
  end
end
