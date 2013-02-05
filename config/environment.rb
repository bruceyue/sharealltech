# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ShareAllTech::Application.initialize!

Rails.logger = Logger.new(STDOUT)

#gem "encryptor"
# used in user.rb model: sets what encryption key to use
Encryptor.default_options.merge!(:key => ShareAllTech::Application.config.secret_token)
