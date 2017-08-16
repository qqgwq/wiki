class SmsJob < ApplicationJob
  queue_as :register

  def perform(*args)
    phone, user = args[0].to_s, args[1].to_s
    ChinaSMS.use :yunpian, password: 'eb2483f50cf7ad8eb8197c1a4bd16b9b'
    tpl_text = "【Mark伯约】亲爱的#{user}, 恭喜你注册成功！"
    ChinaSMS.to phone, tpl_text 
  end
end
