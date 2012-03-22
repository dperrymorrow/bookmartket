require 'spec_helper'

describe Bookmark do

  before (:each) do
    @bookmark = Factory.create(:bookmark)
  end

  if "grabs the domain from teh url" do
    @bookmark.domain.should not_be(nil)
  end

  it "searched correctly" do

  end

end