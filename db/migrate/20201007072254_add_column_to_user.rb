class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :url, :string
    add_column :users, :profile, :string
    add_column :users, :image_name, :string
  end
end
