require File.expand_path(File.dirname(__FILE__) + '/environment')
env :GEM_PATH, ENV['GEM_PATH']

set :output, {:error => 'log/cron_error.log', :standard => 'log/cron.log'}
every 1.day, at: '10:32 am' do
  runner "PersonJob.perform_later"
end