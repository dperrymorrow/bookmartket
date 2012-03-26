class Tag < ActiveRecord::Base

  validates_presence_of :name
  belongs_to :bookmark
  belongs_to :user

end
