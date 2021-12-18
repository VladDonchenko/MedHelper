server "139.59.141.67", user: "#{fetch(:user)}", roles: %w{app db web}, primary: true

set :application, "medhelper"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :environment, "production"
set :rails_env,   "production"

set :nginx_server_name, "medhelper.sytes.net"
set :puma_conf, "#{shared_path}/config/puma.rb"