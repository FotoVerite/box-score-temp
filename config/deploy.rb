# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

set :application, "boxscore"
set :repo_url, "git@github.com:FotoVerite/box-score-temp.git"

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'

set :format, :pretty
# set :log_level, :debug
set :pty, true

set :linked_files, %w[config/database.yml config/master.key]
set :linked_dirs, %w[
      log tmp/pids tmp/cache
      tmp/sockets vendor/bundle
      public/images public/system
      node_modules
    ]
set :bundle_binstubs, nil
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

after "deploy:restart", "app:restart"
