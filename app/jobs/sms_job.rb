class SmsJob < ApplicationJob
  queue_as :register

  def perform(*args)
    ChinaSMS.use :yunpian, password: 'eb2483f50cf7ad8eb8197c1a4bd16b9b'
    ChinaSMS.to '18382012700', "【Mark伯约】Nothing is difficult if you put your heart into it!"
  end
end
