require "spec_helper"

describe Iframe::BookmarksController do

  let(:user){ Factory.create(:user) }

  before(:each) do
    User.set_current_user( user )
  end

  it "redirects to user not found if invalid api key" do
    get :index, :api_key => 'foobar'
    response.should be_redirect
  end

  it "creates a bookmark correctly" do
    post :create, :api_key => user.api_key, :bookmark => Factory.attributes_for(:bookmark)
    response.should be_success
  end

  it "searches for bookmarks" do
    3.times do
      Factory.create( :bookmark, :url => 'https://'+Faker::Internet.domain_name, :title => 'foobar' )
    end

    get :index, :api_key => user.api_key, :search_term => 'foobar'
    assigns(:bookmarks).length.should be 3
  end
end