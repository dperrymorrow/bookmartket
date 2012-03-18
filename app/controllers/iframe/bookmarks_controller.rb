class Iframe::BookmarksController < ApplicationController

  def index
    @user = User.find_by_api_key(params[:api_key])
    render :json => @user.bookmarks
  end

  def create
    @user = User.find_by_api_key(params[:api_key])
    @bookmark = Bookmark.new(params[:bookmark])
    @bookmark.user_id = @user.id

    if @bookmark.save
      render :json => @bookmark
    else
      render :status => :conflict, :json => @bookmark.errors
    end
  end
end