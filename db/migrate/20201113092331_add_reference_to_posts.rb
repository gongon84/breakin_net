class AddReferenceToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user, foreign_key: true, null: false
  end
end
