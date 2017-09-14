namespace :uploads do
  desc 'Upload compiled ember application'
  task :sync do
    run_locally do
      execute :rsync, '-r client/dist/ ap@lemon:~/www/stockdigger/shared/public/'
    end
  end
end
