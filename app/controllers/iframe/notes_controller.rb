class Iframe::NotesController < ApplicationController
  before_filter :find_user

  def index
    @notes = User.get_current_user.notes
    render :json => @notes
  end

  def search
    @notes = Note.search params[:search_term]
    render :json => @notes
  end

  def create
    @note = Note.new params[:note]
    if @note.save
      render :json => @note
    else
      render :status => :conflict, :json => { :errors => @note.errors }
    end
  end
  
  def update
    @note = Note.find params[:id]
    if @note.user.id == User.get_current_user().id
      @note.attributes = params[:note]
      if @note.save
        render :json => {:success => true}
      else
        render_format({:errors => @topic.errors}, :conflict )
      end
    else
      render :status => :forbidden, :json => 'not your note'
    end
  end

  def destroy
    @note = Note.find params[:id]
    if @note.user.id == User.get_current_user().id
      @note.destroy
      render :json => {:success => true}
    else
      render :status => :forbidden, :json => 'not your note'
    end
  end

end