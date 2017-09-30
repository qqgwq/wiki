module V1
  class Users < Grape::API
    format :json
    namespace :users do
      get "people", serializer: V1::UserSerializer, root: 'user' do
        User.all
      end

      desc "获取验证码"
      params do
        requires :phone, type: String, desc: "手机号"
      end
      post 'get_sms_code' do
        #初始化Redis::Value的实例(不为nil)，设定phone作为key并设定过期时间，value为nil
        @phone = Redis::Value.new("#{params[:phone]}", expiration: 2.minutes) 
        @phone.value = sms_code #把sms_code写入redis里面，value不为nil
        SmsCodeJob.perform_later(params[:phone], @phone.value)
      end

      desc "用户注册"
      params do
        requires :name, type: String, allow_blank: false, desc: "用户名"
        requires :email, type: String, allow_blank: false, regexp: /.+@.+/, desc: "邮箱"
        requires :verification_code, allow_blank: false, type: String, desc: "验证码"
        requires :phone, type: String, allow_blank: false, desc: "手机号"
        requires :password, type: String, allow_blank: false, desc: "密码"
        requires :image, type: Rack::Multipart::UploadedFile, allow_blank: false, desc: "上传图片"
      end

      post "signup" do
        @phone = Redis::Value.new("#{params[:phone]}", expiration: 2.minutes)
        return error!({error: "验证码错误"}, 400) if @phone.value == params[:verification_code]
        @user = User.new(params)
        if @user.save
          render @user
        else
          error!({error: @user.errors.full_messages.first},400)
        end
      end
    
    desc "用户登录"
    params do
      requires :login, type: String, desc: "手机号/邮箱"
      requires :password, type: String, desc: "密码"
    end

    post "login", each_serializer: V1::UserSerializer, root: 'user' do
      if params[:login].include?('@')
        @user = User.find_by(email: params[:login])
      else
        @user = User.find_by(phone: params[:login])
      end
      if @user && @user.authenticate(params[:password])
        { token: @user.create_jwt }
      else
        error!({error: @user.errors.full_messages.first}, 400)
        end
      end

      desc "找回密码短信验证码"
      params do
        requires :phone, type: String, desc: "手机号"
      end

      post "get_password_resets_code" do
        @phone = Redis::Value.new("#{params[:phone]}", expiration: 2.minutes)
        @phone.value = sms_code
        PasswordResetJob.perform_later(params[:phone], @phone.value)
      end

      desc "找回密码"
      params do
        requires :phone, type: String, desc: "手机号"
        requires :verification_code, type: String, desc: "验证码"
        requires :password, type: String, desc: "新密码"
      end

      patch "password_resets" do
        @phone = Redis::Value.new("#{params[:phone]}", expiration: 30.minutes)
          return error!({error: "验证码错误"}, 400) if @phone.value != params[:verification_code]
          @user = User.find_by(phone: params[:phone])
        if @user.update_attributes(:password => params[:password])
          { token: @user.create_jwt }
        else
          error!({error: "找回密码失败"}, 400)
      end
    end

    desc "用户编辑, 需要认证"
    params do
      optional :name, type: String, desc: "姓名"
      optional :phone, type: String, desc: "手机号"
      optional :email, type: String, desc: "邮箱"
      optional :image, type: Rack::Multipart::UploadedFile, desc: "头像"
    end

    patch "", serializer: V1::UserSerializer, root: 'user' do
      authenticate!
      if current_user.update(params)
        render current_user
      else
        error!({error: current_user.errors.full_messages.first}, 400)
        end
      end
    end
  end
end