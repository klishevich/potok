# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'potok'
set :deploy_user, 'mike'

set :filter, :roles => %w{app web}
set :scm, :git
set :repo_url, 'git@github.com:klishevich/potok.git'
set :assets_roles, [:app]
set :keep_releases, 5
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :tests, []
set(:config_files, %w(
  database.yml
  unicorn_init.sh
  secrets.yml
))
set(:executable_config_files, %w(
  unicorn_init.sh
))
# set(:symlinks, [
#   {
    # source: "/home/mike/apps/{{full_app_name}}/shared/config/unicorn_init.sh",
    # link: "/etc/init.d/unicorn_{{full_app_name}}"
#   }
# ])

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      invoke 'unicorn:restart2'
    end
  end
  after 'deploy:publishing', 'deploy:restart' 

end

namespace :unicorn do

  desc 'Restart unicorn 2'
  task :restart2 do
    on roles(:app) do
      execute "/etc/init.d/unicorn_potok_production restart"
    end
  end  

end
