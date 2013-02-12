class LoginController < ApplicationController

  layout 'site'

  def new
  end

  def create
    user = User.login_attempt( params[:email], params[:password] )

    if user
      flash[:notice]    = t(:login_success)
      session[:api_key] = user.api_key
      respond_to do |format|
        format.html {redirect_to user_url(user.api_key)}
        format.json {render json: {api_key: user.api_key}}
      end
    else
      flash[:error] = t(:login_fail)
      respond_to do |format|
        format.html {redirect_to new_login_url}
        format.json {render json: {}, status: :forbidden}
      end
    end
  end
end
