class Iframe::TagsController < ApplicationController
  before_filter :find_bookmark
  before_filter :find_user
  skip_before_filter :find_bookmark, :only => [:create]

  def index
    @tags = @bookmark.tags
    render :json => @tags
  end

  def create
    @tag = Tag.new params[:tag]
    if @tag.save
      render :json => @tag
    else
      render :status => :conflict, :json => @tag.errors
    end
  end

  def destroy

  end

  def search
    @tags = Tag.search params[:search_term], @bookmark
    render :json => @tags
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