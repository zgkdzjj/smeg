require 'mina/bundler'
require 'mina/multi_server'
require 'mina/multi_server/select'
require 'mina/multistage'
require "mina/webpacker"
require "mina/whenever/tasks"
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'

set :shared_dirs,   ["local", "log", "node_modules", "pids", "sockets", "public/uploads", "vendor/bundle"]
set :shared_files,  [".env"]

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :servers,     ["47.74.70.59"]
set :app_name,      "smeg"
set :user,          "deploy"
set :deploy_to,     "/home/deploy/smeg_it"
set :repository,    "git@github.com:zgkdzjj/smeg.git"
set :forward_agent, true

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  invoke :'rbenv:load'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  # command %{rbenv install 2.3.0}
end

namespace :git do
  desc "Create a tag to denote the current commit and push to git"
  task :push_tag do
    comment %{Creating tag for current #{fetch(:stage)}}
    command %{git tag -f smeg-#{fetch(:stage)}}
    command %{git push origin smeg-#{fetch(:stage)} --force}
  end
end

namespace :npm do
  desc "Install node modules using npm"
  task install: :environment do
    comment %{Installing node modules using npm}
    command %{yarn install}
  end
end

desc "Restarts Services"
task :restart_services do
  comment %{Restarting System Services for #{fetch(:app_name)}}

  command %{sudo systemctl restart puma}
  command %{sudo systemctl restart sidekiq}
end

desc "Update Whenever tasks"
task :update_whenever do
  comment %{Updating whenever tasks}

  set :whenever_name, fetch(:rails_env)
  invoke :'whenever:update'
end

desc "Deploys the current version to the server."
task :deploy do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'npm:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'webpacker:compile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :environment
      invoke :restart_services
      # invoke :update_whenever
    end
  end

  run :local do
    invoke :'git:push_tag'
  end
end