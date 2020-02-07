class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_user_id
  helper_method :logged_in?
  def current_user_id
    session[:user_id]
  end
  def current_user
    User.find(current_user_id)
  end

  def logged_in?
    !!session[:user_id]
  end
end
