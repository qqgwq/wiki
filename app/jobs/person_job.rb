class PersonJob < ApplicationJob
  queue_as :person

  def perform(*args)
   ChinaSMS.use :yunpian, password: 'eb2483f50cf7ad8eb8197c1a4bd16b9b'
   moblie = "18382012700"
   result = ChinaSMS.to moblie, "【Mark伯约】Nothing is difficult if you put your heart into it!"
   Rails.logger.info result
  end
end