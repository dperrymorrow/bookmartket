class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tags, :through => :bookmarks_tags
end
