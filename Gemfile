source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# Haml is a templating engine for HTML
gem 'haml'

# using bootstrap 3 - flat UI
gem 'bootstrap-sass'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'pry'
# When mail is sent from your application, Letter Opener will open a preview in the browser instead of sending.
gem "letter_opener"

# RSpec for Rails
gem "rspec-rails"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'devise'
gem 'pg'

gem 'carrierwave'
gem 'mini_magick'

gem 'rails-i18n'

gem "font-awesome-rails"
gem 'font-awesome-sass'

gem 'jquery-rails'
#gem 'jquery-ui-sass-rails'
gem 'jquery-ui-rails'
gem 'jquery-tablesorter'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rails_12factor', group: :production
