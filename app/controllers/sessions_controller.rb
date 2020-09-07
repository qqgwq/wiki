class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def new
  end

  #用户登录限制频率
  def create
    @access = "sessions:limiter:#{request.remote_ip}" #获取用户请求计数IP地址
    @lock_ip = "sessions:lock:#{request.remote_ip}" #获取用户请求锁定的ip地址
    if $redis.exists(@lock_ip) #判断用户请求的ip是否存在
      flash[:warning] = "帐号已锁定,请在#{$redis.ttl(@lock_ip) / 60.abs}分钟后登录"
      #被锁定
      render 'new' and return
    else
      #未被锁定,去登录
      login = login_params[:login]
      @user = if login.include?('@')
                User.find_by(email: login)
              else
                User.find_by(phone: login)
              end
      if @user && @user.authenticate(params[:password])
        cookies.permanent[:phone] = @user.phone
        if params[:remember_me]
          cookies.permanent[:auth_token] = @user.auth_token
        else
          cookies[:auth_token] = {value: @user.auth_token, expires: 1.minutes.from_now }
        end
        flash[:success] = "欢迎您! #{@user.name}!"
        $redis.del(@access) #清除失败计数地址
        redirect_back_or_default @user
      else
        #登录失败
        #判断用户请求的地址是否等于1
        if $redis.incr(@access) == 1
           $redis.expire(@access, 1200) #防止redis的时效性,不会因登录时间而影响用户的锁定次数, 20分钟内可以登录3次
           flash.now[:warning] = "账号或密码错误"
           render :new and return
        end
        #判断用户请求的ip次数是否大于等于3
        if $redis.get(@access).to_i >= 3
          #清空储存在redis中的计数ip                                                                      
          $redis.del(@access)
          #setex获取键，设定5分钟过期时间
          $redis.setex(@lock_ip, 300, 'sessions:lock:#{request.remote_ip}')
          #使用set获取键,设定用户锁定ip的过期时间
          # $redis.set(@lock_ip, 'sessions:lock:#{request.remote_ip}')
          # $redis.expire(@lock_ip, 300)
          flash[:warning] = "连续登录3次错误,帐号已锁定, 请5分钟后重新登录"
          redirect_to login_path
        else
          render :new and return
        end
      end
    end
  end


  def destroy
    logout
    redirect_to root_url
    flash[:success] = "退出成功"
  end

  private

  def login_params
    params.permit(:login, :password)
  end
end
