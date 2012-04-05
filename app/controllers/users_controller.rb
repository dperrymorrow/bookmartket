class UsersController < ApplicationController

  layout 'site'
  before_filter :find_user
  skip_before_filter :find_user, :only => [:new, :create]

  def show
    # @user = User.find_by_api_key(params[:id])
    @user = User.get_current_user()
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
