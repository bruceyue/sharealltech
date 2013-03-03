# coding: utf-8
class Post < ActiveRecord::Base
  attr_accessible :body, :category, :dislikes, :is_deleted, :is_published, :likes, :title, :total_comments, :views, :tag_list
  has_many :comments, dependent: :destroy #If you delete a post then its associated comments will also need to be deleted.
  validates :title, :body, presence: true
  validates :title, length: { :minimum => 5 }

  has_many :taggings
  has_many :tags, through: :taggings
  attr_accessible :tag_ids, :comment_ids, :user_id
  belongs_to :user

  attr_accessible :picture
  mount_uploader :picture, PictureUploader

  scope :created_at, lambda { where('created_at <= ?', Time.now.utc) }

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      #Tag.where(name: n.strip).first_or_create!
      Tag.find_or_create_by_name(n.strip)
    end
  end

  def self.search_published(query, tag_id = nil)
    created_at.primitive_search(query)
  end

  def self.primitive_search(query, join = "AND")
    where(primitive_search_conditions(query, join))
  end

  def self.primitive_search_conditions(query, join)
    query.split(/\s+/).map do |word|
      '(' + %w[title body ].map { |col| "#{col} LIKE #{sanitize('%' + word.to_s + '%')}" }.join(' OR ') + ')'
    end.join(" #{join} ")
  end

  # format url
  #Removes all non alphanumeric characters from the string.
  #No more than one of the separator in a row.
  #Remove leading/trailing separator.
  def to_param
    "#{id}-#{title.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}"
  end

end
