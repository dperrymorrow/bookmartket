require "spec_helper"

describe Iframe::TagsController do

  let(:user){ Factory.create(:user) }
  let(:bookmark){ Factory.create(:bookmark) }

  before(:each) do
    User.set_current_user( user )
  end

  context '#find_bookmark' do
    it "returns 404 if bad bookmark" do
      get :index, :api_key => user.api_key, :bookmark_id => '9889898'
      response.status.should == 404
    end

    it "returns 403 if not owner" do
      bookmark.update_attributes :user => Factory.create(:user, :email => Faker::Internet.email)
      get :index, :api_key => user.api_key, :bookmark_id => bookmark.id
      response.status.should == 403
    end
  end

  context "creates a tag" do
    it "creates a tag" do
      post :create, :api_key => user.api_key, :bookmark_id => '0', :tag => {:name => 'foobar'}
      response.should be_success
    end

    it "renders the saved tag as response" do
      post :create, :api_key => user.api_key, :bookmark_id => '0', :tag => {:name => 'foobar'}
      assigns(:tag).name == 'foobar'
    end

    it "renders errors correctly" do
      post :create, :api_key => user.api_key, :bookmark_id => '0', :tag => {:name => ''}
      response.status.should == 409
    end
  end

  it "finds the tags for the bookmark" do
    bookmark.update_attributes( :tags => [Factory.create(:tag)])
    get :index, :api_key => user.api_key, :bookmark_id => bookmark.id
    assigns(:tags).count.should == 1
  end

  it "searches tags when search term is passed" do
    Factory.create(:tag, :name => 'foobar')
    get :search, :api_key => user.api_key, :bookmark_id => bookmark.id, :search_term => 'foobar'
    assigns(:tags).count.should == 1
  end


end