class AddUniqConstraint < ActiveRecord::Migration[5.2]
  def change
    add_index :bookmarks, [:user_id, :recipe_id], unique: true
  end
end
