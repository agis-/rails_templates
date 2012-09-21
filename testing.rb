# This will install & configure RSpec+Capybara+FactoryGirl+shoulda-matchers.
# It will also mix-in FactoryGirl's methods so you can do just build(:factory)
# and will configure rake spec so your factories are tested first.

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

gem_group :test do
  gem 'capybara'
  gem 'shoulda-matchers'
end

run "bundle"

# RSpec & Capybara configuration
run "rails g rspec:install"
run "mkdir spec/factories"
run "mkdir spec/models"
run "cp #{File.expand_path File.dirname(__FILE__)}/lib/factories_spec.rb spec/"
run "cp -f #{File.expand_path File.dirname(__FILE__)}/lib/spec_helper.rb spec/"
run "cp #{File.expand_path File.dirname(__FILE__)}/lib/spec.rake lib/tasks/"
run "cp -f #{File.expand_path File.dirname(__FILE__)}/lib/application.rb config/"