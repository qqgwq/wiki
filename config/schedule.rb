require File.expand_path(File.dirname(__FILE__) + '/environment')
env :PATH, ENV['PATH']

# set :output, {:error => 'log/cron_error.log', :standard => 'log/cron.log'}
# every 1.day, at: '8:30 am' do
#   runner "PersonJob.perform_later"
# end

#每天凌晨清理缓存
set :output, {:error => 'log/cron_error.log', :standard => 'log/cron.log'}
every 1.day, at: '0:00 am' do
  runner "Rails.cache.clear", environment: 'development'
end

#检查节日
set :output, {:error => 'log/cron_error.log', :standard => 'log/cron.log'}
every 1.day, at: '10:35 pm' do
  rake "lunar_rake:all_lunar"
end
