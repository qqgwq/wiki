require File.expand_path(File.dirname(__FILE__) + '/environment')
env :PATH, ENV['PATH']

set :output, {:error => 'log/cron_error.log', :standard => 'log/cron.log'}
every 1.day, at: '10:40 am' do
  runner "PersonJob.perform_later"
end