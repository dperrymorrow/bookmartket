class ApplicationController < ActionController::Base
  protect_from_forgery

  def find_user
    user = User.find_by_api_key(params[:api_key])
    user ||= User.find_by_api_key(params[:id])

    if !user
      redirect_to root_url and return
    else
      User.set_current_user( user )
    end
  end
end
