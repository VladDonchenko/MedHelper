lock "~> 3.15.0"
set :repo_url, "git@github.com:alex-rns/med_helper.git"
# set :repo_url, "https://github.com/alex-rns/med_helper.git"
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :user, "deployer"
set :rvm_ruby_version, "2.7.0"
set :pty, true

set :linked_files, fetch(:linked_files, []).push("config/database.yml", "config/secrets.yml", "config/master.key", "config/puma.rb")
set :linked_dirs,  fetch(:linked_dirs, []).push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads", "public/images", "storage")

set :config_example_suffix, ".example"
set :config_files, ["config/database.yml", "config/secrets.yml"]
set :nginx_use_ssl, false

namespace :deploy do
  before 'check:linked_files', 'set:master_key'
  before 'check:linked_files', 'config:push'
  before 'check:linked_files', 'puma:jungle:setup'
end
after "deploy:finished", "nginx:restart"
# after "deploy:finished", "puma:restart"
after "deploy", "puma:restart"