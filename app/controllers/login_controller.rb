class LoginController < ApplicationController

  def new
  end

  def create
    @user = User.where(
      :email    => params[:email],
      :password => params[:password]
    ).first

    if @user
      flash[:notice] = t(:login_success)
      redirect_to user_url(@user.api_key)
    else
      flash[:error]= t(:login_fail)
      redirect_to new_login_url
    end
  end
end