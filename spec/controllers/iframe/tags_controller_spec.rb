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

  context "#index" do
    it "finds the tags for the bookmark" do
      bookmark.update_attributes( :tags => [Factory.create(:tag)])
      get :index, :api_key => user.api_key, :bookmark_id => bookmark.id
      assigns(:tags).count.should == 1
    end

  end


end