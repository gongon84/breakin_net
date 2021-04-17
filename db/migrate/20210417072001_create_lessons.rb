class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|

      t.references :user, foreign_key: true, null: false
      t.string :pref
      t.string :place
      t.string :station
      t.string :time
      t.string :price
      t.string :profile
      t.string :url

      t.timestamps
    end
  end
end
