class CreateFeedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_items do |t|
      t.integer :user_id, null: false
      t.string :resource_type, null: false
      t.integer :resource_id, null: false

      t.timestamps
    end
  end
end
