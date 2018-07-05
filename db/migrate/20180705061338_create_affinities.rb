class CreateAffinities < ActiveRecord::Migration[5.2]
  def change
    create_table :affinities do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.integer :score

      t.timestamps
    end
  end
end
