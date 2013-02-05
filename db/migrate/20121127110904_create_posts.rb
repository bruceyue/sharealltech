class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :category
      t.boolean :is_published
      t.boolean :is_deleted
      t.integer :views
      t.integer :likes
      t.integer :dislikes
      t.integer :total_comments

      t.timestamps
    end
  end
end
