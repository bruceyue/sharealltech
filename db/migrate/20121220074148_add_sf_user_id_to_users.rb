class AddSfUserIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :sf_user_id, :string
  end
end
