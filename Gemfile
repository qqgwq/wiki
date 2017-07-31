source 'https://rubygems.org'

# git_source(:github) do |repo_name|
#   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
#   "https://github.com/#{repo_name}.git"
# end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0'

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

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
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
gem 'bootstrap-modal-rails'
gem 'nprogress-rails'
gem 'redis-objects'

#性能监控
gem 'newrelic_rpm'

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

#分页
gem 'kaminari'

#验证码
gem 'rucaptcha'
gem 'dalli'

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
gem 'grape'
gem 'hashie-forbidden_attributes'

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
  gem 'capistrano', '~> 3.7'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails'
  gem 'capistrano-sidekiq'
  gem 'capistrano3-puma', '~> 1.2.1'
  gem 'rack-mini-profiler', require: false
  gem 'pry-nav'
  gem 'mysql2'
  gem 'net-ssh', '~>4.1.0'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1.1'
end

group :production do
  gem 'pg', '~> 0.18.2'
end

