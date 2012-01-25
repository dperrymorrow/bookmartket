class Tag < ActiveRecord::Base
  has_many :bookmarks, :through => :bookmarks_tags
  belongs_to :user
end
