class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :likes
      t.integer :dislikes
      t.boolean :is_deleted
      t.belongs_to :post

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
