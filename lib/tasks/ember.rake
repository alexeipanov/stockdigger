namespace :ember do
  desc 'Build Ember Application'
  task build: :environment do
  	exec 'cd client && ember build --environment production'
  end
end
