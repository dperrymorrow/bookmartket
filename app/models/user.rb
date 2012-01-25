class User < ActiveRecord::Base
  has_many :bookmarks
  has_many :tags
  has_many :categories
end
