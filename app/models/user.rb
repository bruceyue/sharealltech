class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :comments
  has_many :posts
  has_many :likes

  def self.find_or_create_context_user(auth_hash, signed_in_resource = nil)
    user = User.find_by_identity_url(auth_hash['uid']) ? User.find_by_identity_url(auth_hash['uid']) : User.where(:email => auth_hash['extra']['email']).first
    user = User.new if !user
    # save OAuth credentials and user info after every authentication
    # because both may change over time.
    user.instance_url     = auth_hash['credentials']['instance_url']
    user.refresh_token    = auth_hash['credentials']['refresh_token']
    user.access_token     = auth_hash['credentials']['token']
    user.identity_url     = auth_hash['uid']
    user.user_name        = auth_hash['extra']['username']
    user.name             = auth_hash['extra']['display_name']
    user.organization_id  = auth_hash['extra']['organization_id']
    user.sf_user_id       = auth_hash['extra']['user_id']
    user.email            = auth_hash['extra']['email']
    user.first_name       = auth_hash['extra']['first_name']
    user.last_name        = auth_hash['extra']['last_name']
    user.password         = auth_hash['extra']['email']
    user.save!
    user
  end

  # uses the Encryptor gem: see https://github.com/shuber/encryptor
  # setter method to encrypt token
  def refresh_token=(raw_token)
    write_attribute(:refresh_token, raw_token.encrypt)
  end

  # getter method to decrypt token
  def refresh_token
    read_attribute(:refresh_token).decrypt
  end

  # setter method to encrypt token
  def access_token=(raw_token)
    write_attribute(:access_token, raw_token.encrypt)
  end

  # getter method to decrypt token
  def access_token
    read_attribute(:access_token).decrypt
  end

  def has_like? post
    likes.find_by_post_id post.id
  end
end
