class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :website_url, :string
    add_column :users, :profile, :string
    add_column :users, :avatar_image, :string
  end
end
