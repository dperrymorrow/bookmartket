require "spec_helper"

describe Iframe::BookmarksController do
  it "redirects to user not found if invalid api key" do
    get :index, :api_key => 'foobar'
    response.should_be success
  end
end