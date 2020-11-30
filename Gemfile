source "https://rubygems.org"
ruby "2.5.1"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.2.0"

# Use Puma as the app server
gem "puma", "~> 3.0"
# Use SCSS for stylesheets
gem "sass-rails", "5.0.7"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"

gem "airbrake"
gem "active_hash"
gem "activeadmin", :git => "https://github.com/activeadmin/activeadmin", branch: "1-4-stable"
gem "inherited_resources", :git => "https://github.com/activeadmin/inherited_resources"
gem "acts_as_list"
gem "american_date"
gem "aws-sdk-s3"
gem "cancan"
gem "chosen-rails"
gem "ckeditor", github: "galetahub/ckeditor", branch: "4-1-stable"
gem "devise"
gem "haml-rails"
gem "will_paginate"
gem "mailchimp-api", require: "mailchimp"
gem "ransack"
gem "modernizr-rails"
gem "newrelic_rpm"
gem "paperclip"
gem "pg"
gem "redcarpet"
gem "simple_form"
gem "stamp"
gem "truncate_html"
gem "rakismet"
gem "font-awesome-rails"
gem "jquery-ui-rails"
gem "compass-rails"
gem "foundation-rails"
gem "maruku"
gem "paranoia"
gem "friendly_id"
gem "kaminari"

# deployment
gem "httparty", require: false
gem "netrc", require: false
gem "rendezvous", require: false
gem "non-stupid-digest-assets"

group :staging, :production do
  gem "figaro"
  gem "guard-rspec"
  gem "launchy"
  # gem 'quiet_assets'
  gem "rb-fsevent", "~> 0.9.1"
  gem "pry"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platform: :mri
  gem "faker"
  gem "dotenv-rails"
  gem "rspec-rails"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console"
  gem "listen"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "capistrano"
  gem "capistrano-bundler", require: false
  gem "capistrano-npm"
  gem "capistrano-rails", require: false
  gem "capistrano-resque", "~> 0.2.2", require: false
  gem "capistrano3-puma", "3.1.0", require: false
  gem "annotate"
end

group :test do
  gem "rails-controller-testing"
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "poltergeist"
  gem "shoulda-matchers"
  gem "turnip"
  gem "vcr"
  gem "webmock", require: false
  gem "simplecov"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
