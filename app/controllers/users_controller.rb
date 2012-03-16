class UsersController < ApplicationController

  layout 'site'

  def show
    @user = User.find_by_api_key(params[:id])
    if !@user
      flash[:error] = t(:cant_find_user)
      redirect_to root_url
    end
  end

  # def edit
  #   @user = User.find_by_api_key(params[:id])
  #   if !@user
  #     flash[:error] = t(:cant_find_user)
  #     redirect_to root_url
  #   end
  # end
  #
  # def update
  #
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = t(:user_created)
      redirect_to user_url(@user.api_key)
    else
      render action: "new"
    end
  end
end
