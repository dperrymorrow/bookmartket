require "spec_helper"

describe Iframe::NotesController do

  let(:user){ Factory.create :user }
  let(:note){ Factory.create :note, :user_id => user.id }

  before(:each) do
    User.set_current_user( user )
  end

  context "#search" do

    it "searches the notes by title" do
      Factory.create :note, :title => 'foobar'
      get :search, :api_key => user.api_key, :search_term => 'Foobar'
      assigns(:notes).count.should == 1
    end

  end

end