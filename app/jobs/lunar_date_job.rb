class LunarDateJob < ApplicationJob
  queue_as :LunarDate

  ChineseHolidays = {
    "duanwu" => "端午节",
    "chongyang" => "重阳节",
    "zhongqiu" => "中秋节",
    "chun" => "春节"
  }.freeze

  def perform(*args)
    traditional_day = traslate_holidays(args[0])
    return unless traditional_day

    ChinaSMS.use :yunpian, password: 'eb2483f50cf7ad8eb8197c1a4bd16b9b'
    tpl_text = "【高万强】今天是#{traditional_day},祝你及你家人节日快乐,心想事成!"
    mobile = family_number
    ChinaSMS.to mobile, tpl_text
  end

  def traslate_holidays(holiday)
    ChineseHolidays[holiday]
  end

  def family_number
    "18382012700, 18808108195, 15882440241, 18981961311, 13308082454, 18203093194, 13340852429, 13996461061, 18782216421"
  end
end