class ApplicationController < ActionController::Base
  protect_from_forgery

  def find_user
    $user = User.find_by_api_key(params[:api_key])
    if !$user
      redirect_to root_url and return
    end
  end
end
