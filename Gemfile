source 'https://gems.ruby-china.org'

# git_source(:github) do |repo_name|
#   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
#   "https://github.com/#{repo_name}.git"
# end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.1'

# Use sqlite3 as the database for Active Record

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'listen', '~> 3.0.5'
#常用
gem 'haml', '4.0.5'
gem 'bootstrap-sass'
gem 'simple_form'
gem 'bcrypt'
gem 'execjs' 
gem 'pry-nav'
gem 'acts_as_commentable_with_threading'
gem 'nprogress-rails'
gem 'redis-objects'
gem 'bootstrap-modal-rails' #模态框
gem 'jquery-validation-rails' #表单验证
gem 'bootstrap-tooltip-rails' #链接/表单/
gem 'awesome_print', :require => 'ap'
#性能监控
gem 'newrelic_rpm'

#阳历转农历
gem 'lunar_blessing', github: 'mycolorway/lunar_blessing'

#图标
gem 'font-awesome-sass'
gem "chartkick"
gem "groupdate"

#表情
gem 'rails_emoji_picker'

gem 'rails-i18n'
gem 'better_errors'

#上传图片
gem 'paperclip'
gem 'paperclip-i18n'
gem 'bootstrap-filestyle-rails'
gem 'carrierwave'
gem 'mini_magick'

#分页
gem 'kaminari'

#富文本编辑器
gem 'simditor', '~> 2.3.6'

#验证码
gem 'rucaptcha'
gem 'dalli'

#微信
gem 'weixin_authorize'
#社交分享按钮
gem 'social-share-button'

#搜索
gem 'ransack'

#友好
gem 'friendly_id'

#短信
gem 'china_sms'

#队列
gem 'sidekiq'
gem 'redis'
gem 'redis-namespace'
gem 'concurrent-ruby'

#定时任务
gem 'whenever', require: false

#接口
gem 'yajl-ruby', require: 'yajl'
gem 'grape'
gem 'hashie-forbidden_attributes'
gem 'jwt'

#api 格式化json
gem 'grape-active_model_serializers'
gem 'active_model_serializers'
gem 'grape_on_rails_routes'

#生成swagger
gem 'grape-swagger'
gem 'grape-swagger-rails'

#跨域
gem 'rack-cors'

group :development do
  gem 'capistrano', '~> 3.9.0'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails'
  gem 'capistrano-sidekiq'
  gem 'capistrano3-puma', '~> 1.2.1'
  gem 'rack-mini-profiler', require: false
  gem 'pry-nav'
  gem 'pg', '~> 0.18.2'
  gem 'net-ssh', '~>4.1.0'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1.1'
  gem 'factory_girl_rails', '~> 4.3.0'
  gem 'rails-controller-testing'
end

group :production do
  gem 'pg', '~> 0.18.2'
end

