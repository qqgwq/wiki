module V1
  class Users < Grape::API
    format :json
    namespace :users do
      get "people", serializer: V1::UserSerializer, root: 'user' do
        User.all
      end

      params do
        requires :name, type: String, desc: "用户名"
        requires :phone, type: String, desc: "手机号"
        requires :password, type: String, desc: "密码"
        requires :image, type: Rack::Multipart::UploadedFile, desc: "上传图片"
      end

      post "signup", serializer: V1::UserSerializer, root: 'user'do
        @user = User.new(params)
        if @user.save
          render @user
        else
          error!({error: @user.errors.full_messages.first},400)
        end
      end
    end
  end
end