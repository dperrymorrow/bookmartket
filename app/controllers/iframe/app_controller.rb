class Iframe::AppController < ApplicationController

  layout 'iframe'
  before_filter :find_user

  def index
  end
end