require 'spec_helper'

describe Tag do

  let(:user){
    Factory.create(:user)
  }

  before(:each) do
    User.set_current_user( user )
  end

  it "validates presence of name" do
    Factory.build(:tag,:name=>'').should_not be_valid
  end

  it "has belongs to a bookmark" do
    bookmark = Factory.create(:bookmark)
    tag = Factory.create(:tag)
    Factory.create(:bookmarks_tag, :bookmark_id => bookmark.id, :tag_id => tag.id)
    tag.should have(1).bookmarks
  end

end