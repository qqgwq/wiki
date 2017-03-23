env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']
set :output, {:error => '~/Desktop/cron.error.log', :standard => '~/Desktop/cron.standard.log'}
every 1.day, at: '10:45 am' do
  runner "PersonJob.perform_later"
end