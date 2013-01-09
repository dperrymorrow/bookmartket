class ImportController < ApplicationController
  layout 'site'
  before_filter :find_user

  def new
  end

  def create
    uploaded_file = params[:bookmarks]
    output        = Import.import_bookmarks uploaded_file.read
    @bookmarks    = output
  end

end
