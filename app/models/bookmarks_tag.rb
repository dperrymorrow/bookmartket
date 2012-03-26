class BookmarksTag < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :tag
end