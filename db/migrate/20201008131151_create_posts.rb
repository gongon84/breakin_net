class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :pref
      t.string :place
      t.string :station
      t.string :facility
      t.string :time
      t.string :price
      t.string :tag
      t.string :memo

      t.timestamps
    end
  end
end