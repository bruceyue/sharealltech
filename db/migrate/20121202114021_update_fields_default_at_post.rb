class UpdateFieldsDefaultAtPost < ActiveRecord::Migration
  def up
    change_column_default(Post, :total_comments, 0)
    change_column_default(Post, :views, 0)
    change_column_default(Post, :likes, 0)
    change_column_default(Post, :dislikes, 0)
  end

  def down
    change_column_default(Post, :total_comments, nil)
    change_column_default(Post, :views, nil)
    change_column_default(Post, :likes, nil)
    change_column_default(Post, :dislikes, nil)
  end
end
