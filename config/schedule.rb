set :output, "#{path}/shared/log/pickpositions.log"
job_type :runner, %(cd :path && bundle exec rails runner -e :environment :task :output)
every 1.day, at: '4:30 am' do
  runner 'PickPositionsJob.perform_now'
end
