# Sentia Base Rails Application

This should be used as Base Application every time we want to create a new Rails App.

## Ruby & Rails Versions
  - ruby 2.4.1
  - rails 5.0.2

## Setup Environment

  - Ruby - rvm/chruby/rbenv

  - Install Node, Webpack, and Yarn.  Recommend to use [nvm](https://github.com/creationix/nvm) - Node Version Manager.

  ```bash
    $ nvm ls-remote       # fetch available versions
    $ nvm install 7.7.4   # any recent version should be suitable
    $ nvm use 7.7.4
    $ npm install yarn webpack webpack-dev-server -g
  ```

## Setup Project

```bash
$ bundle
$ yarn install
$ rake db:create db:migrate
```

## Dependencies
  - postgres
  - redis

## Running Dev Environment

  - single command to get everything running

  ```bash
  $ ./start_server
  ```

  - recommended for debugging (run each process in a separate terminal tab/window)

  ```
  $ redis-server
  $ bundle exec sidekiq
  $ ./bin/webpack-dev-server
  $ rails s
  ```

## CSS and JS Assets

### Gemified CSS/JS

If there is CSS/JS that you require and it cannot be sourced via an NPM package, then
install it via the Gemfile as you normally would, and include this in
`/app/assets/stylesheets/application.scss` and `/app/assets/javascripts/application.js`

### NPM Packages for CSS/JS and Page-specific JS

If you are developing the page specific JS app, and need a JS/CSS package, the preferred
method is to use yarn to install it

`$ yarn add <npm-package-name`

Then include this file and any code you require in the webpack build.  The webpack
build entry points are located in `/app/javascript/packs`.

### Frontend JS code

If you are developing the frontend and need to enter in some JS code, before the page-specific
code is setup, then there should be a special webpack build located in `/app/javascript/packs/frontend_design.js`

You may include any JS code here during front end design, which can be moved to widgets/modules later
in development.

## Setup Heroku

  - Ensure that webpacks are installed in order

  ```
  heroku/nodejs
  heroku/ruby
  ```

  - Configure nodejs

  ```
  heroku config:set NODE_MODULES_CACHE=false
  ```

  - Configure Procfile

  ``` 
  web: bundle exec rails server -p $PORT -e $RAILS_ENV
  worker: bundle exec sidekiq -c 5 -v
  ```

## TODO
  - rspec & guard
  - simple form
  - devise
  - backend user table with filter and pagination as guideline
  - custom validators (email phone abn password?)
# smeg
