require 'spec_helper'

describe Tag do

  before (:each) do
    $user = Factory.create(:user)
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