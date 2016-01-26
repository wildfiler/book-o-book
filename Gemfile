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
gem 'kaminari'
gem 'puma'
gem 'haml'
gem 'monban'

group :production do
  gem 'rails_12factor'
end
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'quiet_assets'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
  gem 'monban-generators'
end

group :development, :test do
  gem 'bundler-audit', require: false
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.3.0'
  gem 'rspec_junit_formatter', '0.2.2'
  gem 'faker'
end

group :test do
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
  gem 'shoulda'
end

group :staging, :production do
  gem 'rack-timeout'
end
