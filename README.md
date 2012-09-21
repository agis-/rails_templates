My Rails Application Templates
====================

You can use templates to automate your common all these changes you do each time you're creating a new Rails application.

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

..soon more..