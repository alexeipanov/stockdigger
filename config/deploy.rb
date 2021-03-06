# config valid only for current version of Capistrano
lock '3.9.1'

set :application, 'stockDigger'
set :repo_url, 'git@bitbucket.org:windstarter/stockdigger.git'

set :rbenv_ruby, '2.4.1'
set :rbenv_type, :user

set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }

# Set up puma
set :puma_threads,    [4, 16]
set :puma_workers,    0
set :puma_bind,       'unix:///home/ap/www/stockdigger/puma.sock'
set :puma_state,      '#{shared_path}/pids/puma.state'
set :puma_pid,        '#{shared_path}/pids/puma.pid'
set :puma_access_log, '#{release_path}/log/puma.error.log'
set :puma_error_log,  '#{release_path}/log/puma.access.log'
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'
set :deploy_to, '/home/ap/www/stockdigger'
set :assets_roles, []

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'
append :linked_files, 'config/secrets.yml.key'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'
append :linked_dirs, 'pids', 'cache', 'public'

# Default value for default_env is {}
# set :default_env, { path: '/opt/ruby/bin:$PATH' }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 3

after 'deploy:finishing', 'ember:build', 'ember:upload'
