class ApplicationController < ActionController::Base
  protect_from_forgery

  def find_user
    user = User.find_by_api_key(session[:api_key]) || User.find_by_api_key(params[:api_key]) || User.find_by_api_key(params[:id])

    if !user
      redirect_to root_url and return
    else
      session[:api_key] = user[:api_key]
      User.set_current_user(user)
    end
  end

end
