source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem "js-routes", '~> 1.3'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production.
# gem 'redis', '~> 3.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'devise', '~> 4.2'
gem 'redcarpet', '~> 3.4'
# To pretiffy markdown code blocks.
gem 'coderay', '~> 1.1'
# To deal with breadcrumbs.
gem 'gretel', '~> 3.0'
gem 'bcrypt', '~> 3.1'
# To calculate source codes similarity.
gem 'moss_ruby', git: 'https://github.com/rwehresmann/moss_ruby.git'
# To compare text.
gem 'amatch'
gem 'delayed_job_active_record', '~> 4.1'
gem 'daemons'
gem 'whenever'
gem 'cancancan', '~> 1.15'
gem 'figaro', '~> 1.1'
gem 'factory_girl_rails', '~> 4.0'
gem 'will_paginate', '~> 3.1.0'
gem 'coffee_routes'
gem 'pg'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.0'
  gem 'rails-controller-testing', '~> 1.0'
  # To generate diagrams based in the current controller and models structure.
  gem 'railroady'
end

group :test do
  gem 'poltergeist', '~> 1.13'
  gem 'database_cleaner', '~> 1.0'
  gem 'capybara', '~> 2.0'
  gem 'shoulda-callback-matchers'
  gem 'simplecov'
  gem 'codeclimate-test-reporter', '~> 1.0.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
