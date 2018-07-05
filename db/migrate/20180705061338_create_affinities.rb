class CreateAffinities < ActiveRecord::Migration[5.2]
  def change
    create_table :affinities do |t|
      t.integer :from_user_id, null: false
      t.integer :to_user_id, null: false
      t.integer :score, null: false, default: 0

      t.timestamps
    end
  end
end
