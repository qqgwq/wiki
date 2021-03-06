# config valid only for current version of Capistrano
lock "3.9.1"

set :application, "wiki"
set :repo_url, "git@github.com:qqgwq/wiki.git"
set :deploy_to, '/home/gwq/wiki'


set :rails_env, 'production'
set :rbenv_ruby, '2.3.3'
set :rbenv_type, :user
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w(rake gem bundle ruby rails sidekiq sidekiqctl)

set :user, 'gwq'
set :pty, false
set :use_sudo, false

set :keep_releases, 3

#set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa) }

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

require "whenever/capistrano"

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
