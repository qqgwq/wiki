every 2.minutes do
  runner "SmsJob.perform_later", :environment => :development
end