module V1
  module Helpers
    def current_user
      @current_user
    end

    def authenticate!
      error!({"error" => "登录已过期, 重新登录"}, 401) unless verification_token
    rescue JWT::DecodeError => e
      error!({"error" => "登录已过期, 重新登录"}, 401)
     rescue JWT::VerificationError => e
       error!({"error" => "验证失败"}, 404)
    end

    def user_token  
      token = (request.env['HTTP_AUTHORIZATION'] || '').strip
      error!({"error" => "登录已过期, 请重新登录"}, 401) if token.blank?
      token
    end

    def verification_token
      #获取请求头的令牌
      jwt = user_token
      #读取令牌携带的用户信息, 此处不验证
      payload, header = JWT.decode(jwt, nil, false)
      user = User.find_by(phone: payload['phone'])
      return false if user.blank?
      #获取验证令牌的密钥
      secret = user.password_digest
      #用密钥与令牌做比较
      payload, header = JWT.decode(jwt, secret)
      #验证成功, 赋值给当前用户
      @current_user = user
    end

    def sms_code
      rand(000000..999999)
    end
  end
end