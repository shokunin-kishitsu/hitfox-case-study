class AuthController < ApplicationController

  skip_filter :check_login

  def sign_in
    login = params[:login]
    password = params[:password]
    user = User.find_by_login_and_password(login, password)
    login(user)
  end

  def sign_up
    login = params[:login]
    password = params[:password]
    user = User.create(login: login, password: password)
    login(user)
  end

  def sign_out
    session.delete(:id)
    redirect_to root_path
  end

  private

  def login user
    session[:id] = user.id if user.present?
    redirect_to root_path
  end

end
