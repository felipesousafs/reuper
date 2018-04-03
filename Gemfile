source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'faker'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Devise + cancancan+ Rolify
gem 'devise'
gem 'cancancan'
gem 'rolify'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'chosen-rails'
gem 'jquery-ui-rails'
gem 'jquery_mask_rails'
gem 'font-awesome-rails'

# Help with Forms
gem 'simple_form'
gem 'cocoon'

# Bootstrap and date-helpers
gem 'bootstrap-datepicker-rails'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
gem 'bootstrap-multiselect_rails'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'momentjs-rails', '>= 2.9.0'

gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap'

gem 'breadcrumbs_on_rails'

gem 'font-awesome-sass'

# Auditoria
gem 'paranoia', '~> 2.2'
gem 'paper_trail'

# pdf
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'wkhtmltopdf-binary-edge'

#temporary (get html content)
require 'open-uri'

gem 'rest-client', '~> 2.0', '>= 2.0.2'