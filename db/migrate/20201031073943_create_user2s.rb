class CreateUser2s < ActiveRecord::Migration[6.0]
  def change
    create_table :user2s do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :url
      t.string :profile

      t.timestamps
    end
  end
end
