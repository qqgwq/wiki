module TestHelper
  def login_as(user)
    request.session[:user_id] = user.id
  end

  def login?
    !request.session[:user_id].nil?
  end

  # def to_param
  #   "#{name}".parameterize
  # end
end