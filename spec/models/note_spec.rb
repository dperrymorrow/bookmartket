require 'spec_helper'

describe Note do

  let(:user){ Factory.create :user }
  let(:note){ Factory.create :note, :user_id  => user.id }

  before(:each) do
    User.set_current_user( user )
  end

  it "has many tags" do
    note.update_attributes :tags => [Factory.create(:tag)]
    note.tags.count.should == 1
  end

  context "#search" do

    it "searches on the title" do
      note.update_attributes :title => 'trimbles'
      Note.search('Trimbles').length.should == 1
    end

    it "searches the body" do
      note.update_attributes :body => 'trimbles'
      Note.search('Trimbles').length.should == 1
    end

    it "finds the notes by tag" do
      note.update_attributes :tags => [Factory.create( :tag, :name => 'horses') ]
      Note.search('Horses').length.should == 1
    end
  end

end