#RUBY CHEATSHEET

## Installation
### Install Curl
> sudo apt-get install curl

### Install NVM 
> curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

### Install node via NVM
> nvm install node

### Install RVM
\curl -sSL https://get.rvm.io | bash -s stable --ruby

### Install important gems
> gem install bundler
> gem install nokogiri
> gem install rails

### Install postgresql and create user
> sudo apt-get install postgresql postgresql-contrib libpq-dev
> sudo -u postgres createuser -s railsdevuser
> sudo -u postgres psql

### Install webpacker, yarn, python2, sublime (if needed)
> rails webpacker:install
> sudo apt install yarn
> apt-get install python2
> sudo apt-get install sublime-text

## Environment 
### New Rails APP
> rails new TestEnvApp -T -d postgresql

### Check active routes
> rails routes

### Start dev server
> rails s

## Database
### Edit database file to add host, username, password
> gedit config/database.yml

### Create DB
> rails db:create

### Migrate DB
> rails db:migrate

### Reset DB
> rails db:setup

### Generators  
#### Generate scaffold
> rails g scaffold Guide title:string

#### Generate model
> rails g model Skill title:string percent_time:integer

#### Generate controller
> rails g controller Pages home about contact

#### Generate resource
> rails g resource Portfolio title:string subtitle:string body:text main_image:text thumb_image:text