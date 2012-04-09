require 'spec_helper'

describe Tag do

  let(:user){ Factory.create(:user)}

  before(:each) do
    User.set_current_user( user )
  end

  it "validates presence of name" do
    tag = Factory.build(:tag,:name=>'')
    tag.valid?
    tag.errors[:name].should == ["can't be blank"]
  end

  it "has belongs to a bookmark" do
    tag = Factory.create(:tag)
    bookmark = Factory.create(:bookmark, :tags => [tag])
    tag.should have(1).bookmarks
  end


  context "searching tags" do

    let(:tag) { Factory.create :tag }
    let(:bookmark) { Factory.create :bookmark }

    it "should find tags by name" do
      tag.update_attributes(:name => 'Horse Blanket')
      Tag.search('Horse',bookmark).first.name.should == 'Horse Blanket'
    end

    it "should not be case sensitive" do
      tag.update_attributes(:name => 'Horse Blanket')
      Tag.search('horse',bookmark).first.name.should == 'Horse Blanket'
    end

    it "shouldnt return tags that the bookmark already has" do
      tag.update_attributes(:name => 'Horse Blanket')
      bookmark.update_attributes(:tags => [tag])
      Tag.search('Horse', bookmark).count.should == 0
    end

  end
end