class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :skill
      t.string :limit

      t.timestamps
    end
  end
end
