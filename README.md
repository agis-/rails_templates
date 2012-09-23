My Rails Application Templates
================================

You can use application templates to automate these common tasks you do each time you're creating a new Rails application.

Usage
---------

Create a new app using the full template:

    rails new myapp -m full.rb

Or apply a template to an existing app:

    rake rails:template LOCATION=./testing.rb

Templates
-------------
* full.rb: This will create and configure an application with PostgreSQL, RSpec, Capybara, factory_girls, shoulda-matchers & Thin.
* testing.rb: This will just install and configure RSpec, Capybara, factory_girls & shoulda-matchers.

Point at http://guides.rubyonrails.org/generators.html#application-templates for more info on writing your own templates.