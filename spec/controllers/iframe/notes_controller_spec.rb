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

  context "create a note" do

    it "creates a note successfully" do
      post :create, :api_key => user.api_key, :note => Factory.attributes_for( :note )
      response.should be_success
    end

    it "renders conflict on erros" do
      post :create, :api_key => user.api_key, :note => {}
      response.status.should == 409
    end
  end

  it "finds all the notes for a user" do
    Factory.create :note
    get :index, :api_key => user.api_key
    assigns(:notes).length.should == 1
  end

  context "delete the note" do

    it "deletes the note" do
      delete :destroy, :api_key => user.api_key, :id => Factory.create( :note ).id
      response.should be_success
    end

    it "should not let you delete notes that are not yours" do
      note = Factory.create( :note, :user => Factory.create(:user) )
      delete :destroy, :api_key => user.api_key, :id => note.id
      response.status.should == 403
    end

  end

end