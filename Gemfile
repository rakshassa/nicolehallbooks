source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.8'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'duktape'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.10.1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# gem "font-awesome-rails"
gem 'font_awesome5_rails'
# gem 'bootstrap-sass', '~> 3.3'

# gem 'libv8', '7.3.492.27.1'
# gem 'mini_racer', '0.2.8'
# gem 'therubyracer', :platform => :ruby
gem 'sassc', '2.2.1'
gem 'bootstrap', '4.6.1' # version >5 uses data-bs-toggle instead (more breaking changes?)
gem 'jquery-rails'
gem 'bootstrap-datepicker-rails'

gem "wysiwyg-rails"
gem 'will_paginate-bootstrap4'

# https://console.developers.google.com/navigation-error;errorUrl=%2Fapis%2Fdashboard%3Fproject%3Dinsteon-sample&authuser%3D3/permissions?authuser=3&folder=&organizationId=&project=nicolehallbooks
# gem 'omniauth-google-oauth2'

# mailchimp integration
# gem 'gibbon'

# mailerlite integration
gem 'mailerlite'
gem 'recaptcha'

# Need the sdk to use s3 bucket storage
gem 'aws-sdk-s3', '~> 1.68'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
