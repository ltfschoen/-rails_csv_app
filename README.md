# README

This README would normally document whatever steps are necessary to get the
application up and running.

---

# Table of Contents
  * [System Requirements](#part-1000)
  * [Database](#part-1100)
  * [Original Setup Steps](#part-2000)

---

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

## Original Setup Steps <a id="part-2000"></a>

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

* Install default Gems in Gemfile
	`bundle install`

* Migrate into PostgreSQL Database
	```
	rake db:create
	rake db:migrate RAILS_ENV=development
	```

* Run server
	`rails s`

* Open app
	`open http://localhost:3000`




