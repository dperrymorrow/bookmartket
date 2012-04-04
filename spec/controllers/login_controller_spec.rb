require "spec_helper"

describe LoginController do

  let(:user){ Factory.create(:user, :password => 'pa55word') }

  it "logs in a user" do
    post :create, :email => user.email, :password => 'pa55word'
    response.should redirect_to( user_url(user.api_key) )
  end

  it "renders login action" do
    get :new
    response.should be_success
  end

end
