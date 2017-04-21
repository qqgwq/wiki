require File.expand_path(File.dirname(__FILE__) + '/environment')

set :output, {:error => 'log/cron_error.log', :standard => 'log/cron.log'}
every 1.day, at: '9:57 am' do
  runner "PersonJob.perform_later"
end