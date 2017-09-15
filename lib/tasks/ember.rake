namespace :ember do
  desc 'Build Ember Application'
  task :build do
  	exec 'cd client && ember build --environment production'
  end

  desc 'Upload compiled Ember application'
  task :upload do
    run_locally do
      execute :rsync, '-r client/dist/ ap@lemon:~/www/stockdigger/shared/public/'
    end
  end
end
