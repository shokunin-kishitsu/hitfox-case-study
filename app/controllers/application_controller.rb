class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_login
  helper_method :current_user

  def check_login
    if current_user.nil?
      render 'auth/login'
    end
  end

  private

  def current_user
    User.find(session[:id])
  end
end
