source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'

gem 'rack-cors', :require => 'rack/cors'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'sidekiq'

gem 'devise'
gem 'omniauth'
gem 'knock'

gem 'simple_states'

gem 'pundit'

gem 'haml-rails'


group :development, :test do
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-remote'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'letter_opener_web'
  gem 'web-console', '>= 3.3.0'
  gem 'bulk_insert'
end

group :test do
  gem 'rspec-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
