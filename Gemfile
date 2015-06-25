source 'https://rubygems.org'

ruby '2.1.3'

gem 'rails', '3.2.21'

gem 'airbrake'
gem 'active_hash'
gem 'activeadmin'
gem 'acts_as_list'
gem 'american_date'
gem 'aws-sdk', '~> 1.6'
gem 'cancan'
gem 'chosen-rails'
gem 'ckeditor'
gem 'devise'
gem 'haml-rails'
gem 'jquery-rails'
gem 'kaminari'
gem 'mailchimp-api', require: 'mailchimp'
gem 'meta_search',    '>= 1.1.0.pre'
gem 'modernizr-rails'
gem 'newrelic_rpm'
gem 'paperclip'
gem 'pg'
gem 'redcarpet'
gem 'simple_form'
gem 'stamp'
gem 'puma'
gem 'rakismet'

# deployment
gem 'httparty', require: false
gem 'netrc', require: false
gem 'rendezvous', require: false

group :staging, :production do
  gem 'rails_12factor'
end

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'
  gem 'font-awesome-rails'
  gem 'jquery-ui-rails'
  gem 'maruku'
  gem 'sass'
  gem 'sass-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation'
end

group :development, :test do
  gem 'byebug'
  gem 'faker'
  gem 'figaro'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'quiet_assets'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'rspec-rails'
  gem 'pry'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'poltergeist'
  gem 'shoulda-matchers'
  gem 'turnip'
  gem 'vcr'
  gem 'webmock', require: false
end
