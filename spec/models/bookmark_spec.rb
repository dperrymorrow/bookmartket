require 'spec_helper'

describe Bookmark do

  before (:each) do
    @bookmark = Factory.create(:bookmark)
  end

  it "grabs the domain from the url" do
    @bookmark.domain.should_not == nil
  end
  #
  # it "searched correctly" do
  #
  # end

end