class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user
      t.references :post

      t.timestamps
    end
    add_index :likes, :user_id
    add_index :likes, :post_id
  end
end
