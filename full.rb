# Use this for a fully-armed app:
# Postgres, Thin, RSpec, Shoulda, Capybara, FactoryGirl (plus some tricks)

database_name = ask("What do you want to call the database?")

run "rm public/index.html"
run "mv README.rdoc README.md"

gem "pg"
gem "thin"

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

gem_group :test do
  gem 'capybara'
  gem 'shoulda-matchers'
end


run "bundle"

# Database configuration
run "cp -f #{File.expand_path File.dirname(__FILE__)}/lib/database.yml config/"
run "perl -pi -w -e 's/db_name/#{database_name}/g;' config/database.yml"
run "createdb #{database_name}"
run "createdb #{database_name}_dev"
run "createdb #{database_name}_test"
rake "db:create"

# RSpec & Capybara configuration
run "rails g rspec:install"
run "mkdir spec/factories"
run "mkdir spec/models"
run "cp #{File.expand_path File.dirname(__FILE__)}/lib/factories_spec.rb spec/"
run "cp -f #{File.expand_path File.dirname(__FILE__)}/lib/spec_helper.rb spec/"
run "cp #{File.expand_path File.dirname(__FILE__)}/lib/spec.rake lib/tasks/"
run "cp -f #{File.expand_path File.dirname(__FILE__)}/lib/application.rb config/"


# Git
git :init
run "echo *.DS_Store >> .gitignore"
git add: "."
git commit: "-a -m 'Initial commit (full template used)'"