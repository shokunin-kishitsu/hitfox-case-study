class AuthController < ApplicationController

  skip_filter :check_login

  def sign_in
    login = params[:login]
    password = params[:password]
    user = User.find_by_login(login).try(:authenticate, password)
    validate(user, 'Incorrect username and/or password')
  end

  def sign_up
    login = params[:login]
    password = params[:password]
    user = User.create(login: login, password: password)
    validate(user, 'Could not register user')
  end

  def sign_out
    session.delete(:id)
    redirect_to root_path
  end

  private

  def validate user, error_msg
    if user
      session[:id] = user.id
    else
      flash[:error] = error_msg
    end
    redirect_to root_path
  end

end
