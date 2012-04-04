require 'spec_helper'

describe User do

  let(:user){Factory.create(:user)}

  it "encrypts the password" do
    user = Factory.create(:user, :password => 'foobar')
    user.reload.password.should_not be 'foobar'
  end

  it "password must be longer than 5" do
    Factory.build(:user, :password => 'foo').should_not be_valid
  end

  it "generates an api key on user create" do
    Factory.create(:user).api_key.should_not be_empty
  end

  it "verifys a users login credentials" do
    user = Factory.create(:user, :password => 'pa55word')
    User.login_attempt(user.email, 'pa55word').should == user
  end

  it "has many tags" do
    tag = Factory.create(:tag, :user_id => user.id)
    user.should have(1).tags
  end

  it "stores the user successfully" do
    User.set_current_user( user )
    User.get_current_user.should be_an_instance_of(User)
  end
end