class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings
	has_many :posts, through: :taggings

	attr_accessible :post_id # for rails admin
end
