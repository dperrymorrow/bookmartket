class Iframe::TagsController < ApplicationController
  before_filter :find_bookmark, :find_note
  before_filter :find_user
  skip_before_filter :find_bookmark, :find_note, :only => [:create]

  def index
    @tags = @bookmark.tags if @bookmark
    @tags = @note.tags if @note
    @tags ||= User.get_current_user().tags
    render :json => @tags

  end

  def create
    @tag         = Tag.new params[:tag]
    existing_tag = User.get_current_user().tags.find_by_name(@tag.name)

    if existing_tag 
      render :json => existing_tag
      return
    end

    if @tag.save
      render :json => @tag
    else
      render :status => :conflict, :json => @tag.errors
    end
  end

  def destroy
  end

  def find_bookmark
    return if !params[:bookmark_id]
    @bookmark = Bookmark.find_by_id params[:bookmark_id]
    if !@bookmark
      render :json => 'not found', :status => :not_found
      return
    elsif @bookmark.user.api_key != params[:api_key]
      render :json => 'not owner', :status => :forbidden
      return
    end
  end
  
  def find_note
    return if !params[:note_id]
    @note = Note.find_by_id params[:note_id]
    if !@note
      render :json => 'not found', :status => :not_found
      return
    elsif @note.user.id != User.get_current_user().id
      render :json => 'not owner', :status => :forbidden
      return
    end
  end

end
