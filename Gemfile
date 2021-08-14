source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'friendly_id', '~> 5.4', '>= 5.4.2'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.1'
  gem 'ffaker', '~> 2.18'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.2'
  gem 'rubocop-rails', '~> 2.9', '>= 2.9.1', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
