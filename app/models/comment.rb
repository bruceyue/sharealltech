class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :dislikes, :is_deleted, :likes
  validates :body, presence: true

  attr_accessible :post_id # for rails admin
  belongs_to :user
end
