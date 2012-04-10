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

  context "creating bookmark" do
    it "creates a bookmark correctly" do
      post :create, :api_key => user.api_key, :bookmark => Factory.attributes_for(:bookmark)
      response.should be_success
    end

    it "assigns the tags on create" do
      tag1 = Factory.create :tag
      tag2 = Factory.create :tag

      post :create, :api_key => user.api_key, :bookmark => Factory.attributes_for(:bookmark, :tag_ids => [tag1.id,tag2.id])
      assigns(:bookmark).should have(2).tags
    end
  end

  it "searches for bookmarks" do
    3.times do
      Factory.create( :bookmark, :url => 'https://'+Faker::Internet.domain_name, :title => 'foobar' )
    end

    get :search, :api_key => user.api_key, :search_term => 'foobar'
    assigns(:bookmarks).length.should be 3
  end

  it "deletes the bookmark" do
    delete :destroy, :api_key => user.api_key, :id => Factory.create(:bookmark).id
    response.should be_success
  end

  it "does not let you delete a bookmark you do not own" do
    f_user = Factory.create(:user, :email => Faker::Internet.email())
    delete :destroy, :api_key => user.api_key, :id => Factory.create(:bookmark, :user_id => f_user.id).id
    response.status.should == 403

  end
end