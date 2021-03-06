class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :post, foreign_key: true
      t.string :pref
      t.string :place
      t.string :name
      t.string :comment

      t.timestamps
    end
  end
end
