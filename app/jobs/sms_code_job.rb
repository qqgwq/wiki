class SmsCodeJob < ApplicationJob
  queue_as :SmsCode

  def perform(*args)
    phone, code = args[0].to_s, args[1].to_s
    ChinaSMS.use :yunpian, password: 'eb2483f50cf7ad8eb8197c1a4bd16b9b'
    tpl_text = "【Mark伯约】你的注册短信验证码是#{code}, 请勿向他人泄露!"	
    ChinaSMS.to phone, tpl_text
  end
end
