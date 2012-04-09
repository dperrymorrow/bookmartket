class Iframe::TagsController < ApplicationController
  before_filter :find_bookmark
  before_filter :find_user

  def index
    @tags = @bookmark.tags
    render :json => @tags
  end

  def create

  end

  def destroy

  end

  def find_bookmark
    @bookmark = Bookmark.find_by_id params[:bookmark_id]
    if !@bookmark
      render :json => 'not found', :status => :not_found and return
    elsif @bookmark.user != User.get_current_user()
      render :json => 'not owner', :status => :forbidden and return
    end
  end

end