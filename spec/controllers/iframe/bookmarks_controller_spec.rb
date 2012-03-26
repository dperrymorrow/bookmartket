require "spec_helper"

describe Iframe::BookmarksController do

  before (:each) do
    @user = Factory.create(:user)
  end

  it "redirects to user not found if invalid api key" do
    get :index, :api_key => 'foobar'
    response.should be_redirect
  end

  it "creates a bookmark correctly" do
    post :create, :api_key => @user.api_key, :bookmark  => Factory.attributes_for(:bookmark)
    response.should be_success
  end

  it "searches for bookmarks" do
    3.times do
      Factory.create( :bookmark, :title => 'foobar', :user_id => @user.id )
    end

    get :index, :api_key => @user.api_key, :search_term => 'foobar'
    assigns(:bookmarks).length.should == 3
  end
end