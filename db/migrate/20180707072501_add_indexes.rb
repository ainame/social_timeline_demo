class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :recipes, :user_id
    add_column :feed_items, :actor_id, :integer, null: false
    add_index :feed_items, :user_id
  end
end
