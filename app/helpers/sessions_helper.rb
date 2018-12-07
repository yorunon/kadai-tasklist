module SessionsHelper
  def currrnet_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!currrnet_user
  end
end
