module CheckController
  extend ActiveSupport::Concern

  def check_email
    if User.exists?(email: params[:email])
      render json: {errors: '邮箱已被占用'}, status: 200
    else
      render json: {}, status: 404
    end
  end

  def check_phone
    if User.exists?(phone: params[:phone])
      render json: {errors: '手机号已被占用'}, status: 200
    else
      render json: {}, status: 404
    end
  end

  def check_name
    if User.exists?(name: params[:name])
      render json: {errors: "用户名已被占用"}, status: 200
    else
      render json: {}, status: 404
    end
  end
end