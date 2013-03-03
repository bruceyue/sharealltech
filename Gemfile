source 'http://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'omniauth-salesforce', ">=1.0.3"
gem 'omniauth'
gem 'databasedotcom'
gem 'encryptor'
gem 'gravatar_image_tag'

group :production do
  #gem 'thin'
end

gem 'pg'  # heroku gem provides pg in dev mode for prod consistency

group :development, :test do
  #gem 'sqlite3'
	gem 'unicorn' # Use unicorn as the app server
end

gem 'thin'

gem 'jquery-rails'

gem 'kaminari' # for rails admin bug.
gem 'rails_admin' # A Rails engine that provides an easy-to-use interface for managing your data.
gem 'devise' #Users management
gem 'redcarpet' #markdown
gem 'coderay' #syntax highlight
gem 'will_paginate', '3.0.2'
gem 'md_emoji'
gem 'carrierwave' # image upload
gem 'cloudinary' # image store

# To use Truncate_html for cutting off a string of HTML
# See https://github.com/hgmnz/truncate_html
# gem 'truncate_html'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'



# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
