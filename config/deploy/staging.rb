set :deploy_to, "/var/www/boxscore_staging"
set :user, "deploy"
set :branch, "master"
set :ssh_options, forward_agent: true, port: 21500
set :workers, "*" => 2

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
role :app, %w[deploy@104.248.182.137]
role :web, %w[deploy@104.248.182.137]
role :db,  %w[deploy@104.248.182.137]