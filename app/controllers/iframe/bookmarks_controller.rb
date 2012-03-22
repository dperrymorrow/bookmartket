class Iframe::BookmarksController < ApplicationController

  before_filter :find_user

  def index
    if params[:search_term]
      @user.bookmarks.search
    else
      @user.bookmarks
    end
    render :json => @bookmarks
  end

  def create
    @bookmark         = Bookmark.new(params[:bookmark])
    @bookmark.user_id = @user.id

    if @bookmark.save
      render :json => @bookmark
    else
      render :status => :conflict, :json => @bookmark.errors
    end
  end
end