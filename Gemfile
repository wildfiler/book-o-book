source 'https://rubygems.org'

ruby '2.2.4'

gem 'rails', '4.2.5'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'normalize-rails', '~> 3.0.0'
gem 'autoprefixer-rails'
gem 'jquery-rails'
gem 'puma'
gem 'haml'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'quiet_assets'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
end

group :development, :test do
  gem 'bundler-audit', require: false
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.3.0'
end

group :test do
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'rack-timeout'
end

