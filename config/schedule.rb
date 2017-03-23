require File.expand_path(File.dirname(__FILE__) + '/environment')

set :output, {:error => '~/Desktop/cron.error.log', :standard => '~/Desktop/cron.standard.log'}
every 1.day, at: '13:42 pm' do
  runner "PersonJob.perform_later"
end