class CreateFeedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_items do |t|
      t.integer :user_id
      t.string :resource_type
      t.integer :resource_id

      t.timestamps
    end
  end
end
