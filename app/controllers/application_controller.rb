class ApplicationController < ActionController::Base
  protect_from_forgery

  def find_user
    @user = User.find_by_api_key(params[:api_key])
    redirect_to root_url and return if !@user
  end
end
