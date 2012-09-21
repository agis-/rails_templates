# Fully-armed application template
#
# Postgres, Thin, RSpec, Shoulda, Capybara, FactoryGirl (plus some tricks)

database_name = ask("What do you want to call the database?")

run "rm public/index.html"
run "mv README.rdoc README.md"

gem "pg"
gem "thin"

require_relative 'testing'

# Database configuration
run "cp -f #{File.expand_path File.dirname(__FILE__)}/lib/database.yml config/"
run "perl -pi -w -e 's/db_name/#{database_name}/g;' config/database.yml"
run "createdb #{database_name}"
run "createdb #{database_name}_dev"
run "createdb #{database_name}_test"
rake "db:create"

# Git
git :init
run "echo *.DS_Store >> .gitignore"
git add: "."
git commit: "-a -m 'Initial commit (full template used)'"