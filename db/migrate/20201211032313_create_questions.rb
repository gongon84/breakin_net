class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :comment

      t.timestamps
    end
  end
end
