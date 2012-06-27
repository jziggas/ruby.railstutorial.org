module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    # "or equals" operator -- Its effect is to set the @current_user instance variable
    # to the user corresponding to the remember token, but only if @current_user is undefined
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
