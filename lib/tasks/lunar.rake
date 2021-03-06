require 'ruby_lunardate'
Holidays = {
  "duanwu" => "0505",
  "chongyang" => "0909",
  "zhongqiu" => "0815",
  "chun" => "1230"
}.freeze

namespace :lunar_date do
  task :all_lunar => :environment do
    traditional_festival
  end
end

def traditional_festival
  current_lunar_day = ("#{(LunarDate.from_solar(Time.now.year, Time.now.month, Time.now.day))}")
  if Holidays.value?(current_lunar_day.to_date.strftime("%m%d"))
    holiday = Holidays.key(current_lunar_day.to_date.strftime("%m%d"))
    LunarDateJob.perform_now(holiday)
  end
end