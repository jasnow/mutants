source 'https://rubygems.org'

ruby "2.1.1" # For deployment to Heroku

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'foreigner'

gem 'nilify_blanks'

gem 'haml-rails'

gem 'bootstrap-sass', '~> 3.1.1'

gem 'simple_form'

group :development, :test do
  # Use mysql as the database for Active Record
  gem 'mysql2'
  gem 'rspec-rails'
  gem 'connection_pool'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'site_prism'
  gem "factory_girl_rails", :require => false
  gem "capybara"
  gem 'selenium-webdriver'
  gem "launchy"
  gem 'simplecov', '~> 0.7.1', :require => false
end

group :production do
  gem 'rails_12factor' # For deployment to Heroku
  gem 'pg'             # For deployment to Heroku
end

gem 'thin'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

