class LoginController < ApplicationController

  layout 'site'

  def new
  end

  def create
    user = User.login_attempt( params[:email], params[:password] )

    if user
      flash[:notice]    = t(:login_success)
      session[:api_key] = user.api_key
      redirect_to user_url(user.api_key)
    else
      flash[:error] = t(:login_fail)
      redirect_to new_login_url
    end
  end
end
