# README

---

# Table of Contents
  * [System Requirements and Info](#part-1000)
  * [Database](#part-1100)
  * [Documentation Links](#part-1500)
  * [Setup - Legacy Initial Steps](#part-2000)
  * [Setup - Replace Unit Test with RSpec](#part-3000)
  * [Setup - Git Repo](#part-4000)
  * [Setup - Git Releases and Tags](#part-5000)
  * [Feature - CSV Upload and Display](#part-6000)

---

## Goals

* [X] - Import pre-populated CSV into database from web form.
* [X] - Present populated data from database in table view
* [ ] - Use AJAX and apply basic filters on table so data updated without refreshing whole page.

## System Requirements and Info<a id="part-1000"></a>
* Show System Setup
    `rails about`

* Versions used:
    * Rails - 5.0.2
    * Ruby - 2.4.0-p0 (see .ruby-version)
    * RubyGems - 2.6.10
    * Ruby Gemset - rails_csv_app (see .ruby-gemset)
    * Rack - 2.0.1
    * Node.js - 7.7.1 (V8 runtime)
    * PostgreSQL - 9.6.2
    * RSpec - 3.5.4
    * OS - macOS El Capitan

* Show Codebase Stats
    `rails stats`

## Database <a id="part-1100"></a>

* Run PostgreSQL without background service:
	`pg_ctl -D /usr/local/var/postgres start`
* Configure to start PostgreSQL and restart at login using launchd background service:
	`brew services start postgresql`
* Open PostgreSQL Database console automatically http://guides.rubyonrails.org/command_line.html
    `rails dbconsole`

* Show database table contents
    ```
    select * from products;
    ```

## Documentation Links <a id="part-1500"></a>

* Testing
    * RSpec Rails https://github.com/rspec/rspec-rails

## Setup - Legacy Initial Steps <a id="part-2000"></a>

* Create Project
	```
	rails new rails_csv_app --database=postgresql
	rvm list
	```

* Install latest RVM to install and use latest Ruby version. Update PostgreSQL.
	```
	rvm get master
	rvm install ruby-2.4.0
	brew upgrade bash
	brew update
	brew reinstall postgresql
	rvm reinstall ruby-2.4.0
	rvm use ruby-2.4.0
	```

* Update to latest RubyGems version https://rubygems.org/pages/download
    ```
    gem install rubygems-update
    update_rubygems
    gem update --system
    ```

* Update to latest JavaScript Runtime. Install NVM.
  Check latest stable Node.js version https://nodejs.org
  Check current version and update.
  Install latest version of NPM.
    ```
    node -v
    npm install -g npm
    nvm install 7.7.1
    nvm use 7.7.1
    ```

* Create custom Gemset with RVM
	```
	rvm gemset create rails_csv_app
	rvm --ruby-version use 2.4.0@rails_csv_app
	```

* Check latest Rails version that is available: https://rubygems.org/gems/rails/versions
* Install latest specific Rails version
	`gem install rails --version 5.0.2`

* Check database.yml is setup correctly for development

* Check that using custom GemSet. Install default Gems in Gemfile
    ```
    rvm --ruby-version use 2.4.0@rails_csv_app
    gem install bundler
	bundle install
	```

* Migrate into PostgreSQL Database
	```
	rake db:create db:migrate RAILS_ENV=development
	```

* Launch the Rails server in separate Terminal tab automatically and opens it in web browser after 10 seconds using Shell Script:
    `bash launch.sh`

    * Alternatively: Run server command, and then manually go to url, or in a separate tab run command to open app in browser
    	`rails s`
    	`open http://localhost:3000`

## Setup - Replace Test Unit / Minitest with RSpec <a id="part-3000"></a>

* Optionally run Test Unit one last time before sending it to oblivion
    `rake test`

* Remove Test Unit's directory and files
    `rm -rf test/`

* Add RSpec to test group within Gemfile to retrieve latest patch https://github.com/rspec/rspec-rails
    `gem 'rspec-rails', '~> 3.5.2'`

* Check that using Custom GemSet. Install Gems
    ```
    rvm --ruby-version use 2.4.0@rails_csv_app
    bundle install
    ```

* Initialise /spec directory
    `rails generate rspec:install`

* Run RSpec tests
    `rspec`

## Setup - Git Repo <a id="part-4000"></a>

* Create new project on GitHub with MIT licence i.e. https://github.com/ltfschoen/rails_csv_app

* Show remote branches for current repo
    `git remote -v`

* Set a remote URL using SSH
    `git remote add origin git@github.com:ltfschoen/rails_csv_app.git`

* Use [Bulletproof Git Workflow](https://gist.github.com/ltfschoen/3c7a085f132baf4aff13c9d561b35d03) to rebase with remote branch and get the MIT licence before pushing new changes
    `git pull --rebase origin master`

* Force push to remote branch to overwrite existing history
    `git push -f origin master`

## Setup - Git Release and Tags <a id="part-5000"></a>

* Create New Release https://github.com/ltfschoen/rails_csv_app/releases/new
    * Pre-Release (non-production) i.e. v0.1

## Feature - CSV Upload and Display <a id="part-6000"></a>

### CSV Setup

* Create new Git branch
	```
	git checkout -b feature/csv
	```

* Generate Model
    ```
    rails g model Product name:string quantity:integer price:decimal comments:string
    ```

* Modify the migration file as follows:
	`t.decimal :price, precision: 12, scale: 2`

* Migrate
    `rake db:migrate RAILS_ENV=development`

* Generate Controller with index and import Actions
    `rails g controller Products index import`

* Modify Routes as follows:
	```
	resources :products do
	  collection { post :import }
	end

	root to: "products#index"
	```

* Update Product Model import function to accept CSV and process each row by
comparing with Product table of database, and either updating or creating new entry

* Update Product Controller's index action to fetch all Products to be available in view
as @products. Also update its import action to call the Product Model's import function
passing a given file parameter as argument, and then redirecting user to the root url

* Update Product's index View to display list of products, including form allowing user to
upload the CSV by submitting form

* Create a CSV file called products.csv

* Run server and upload the CSV file, then check it exists in database. Drop database and re-migrate to further test
	```
	rails dbconsole
	select * from products;
	rake db:drop
	rake db:migrate RAILS_ENV=development
	```

* Add Unit Tests by adding the following gem to allow use of `assigns` in Controller tests
	`gem 'rails-controller-testing', '~> 1.0.1'`

* Modify Unit Tests for Product Controller and Model
	* Reference: http://stackoverflow.com/questions/15175970/undefined-method-when-running-rspec-test-using-a-stub

* Create New Release https://github.com/ltfschoen/rails_csv_app/releases/new
    * Feature Release (non-production) i.e. v0.2









