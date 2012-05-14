source 'https://rubygems.org'

gem 'rails', '3.2.1'
gem "mysql2"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'thin'
gem 'haml-rails'
gem 'koala'
gem 'sass-rails',   '~> 3.2.3'
gem 'nokogiri'
gem "xmvc"
gem "extjs"
gem "therubyracer"


# Gems used only for assets and not required
# in production environments by default.
group :assets do

  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'json'
gem 'jquery-rails'

group :development do
  gem 'foreman'
end
#Check responses
gem 'httparty'

# Test frameworks
group :development, :test do
  gem 'rspec-rails', '2.9.0'
  gem 'factory_girl_rails', '1.0.1'
  gem 'ffaker'
  gem "shoulda", "~> 2.11"
  gem "shoulda-matchers"
  gem 'spork', '~> 1.0.0.rc'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'pickle'
  gem 'ruby-debug19'
  gem "simplecov", :require => false
end

group :heroku, :production do
  gem "therubyracer-heroku"
  gem "pg", :require => "pg"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
