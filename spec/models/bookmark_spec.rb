require 'spec_helper'

describe Bookmark do

  before (:each) do
    @bookmark = Factory.create(:bookmark)
    @user = Factory.create(:user)
  end

  it "grabs the domain from the url" do
    @bookmark.domain.should_not == nil
  end

  it "searched correctly" do
    Factory.create(:bookmark, :title => 'foobar', :user_id => @user.id )
    Factory.create(:bookmark, :title => 'foobar', :user_id => @user.id )
    Bookmark.search( @user.api_key, 'foobar').count.should == 2
  end

end