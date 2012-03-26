class Tag < ActiveRecord::Base

  validates_presence_of :name
  has_many :bookmarks_tag
  has_many :bookmarks, :through => :bookmarks_tag
  belongs_to :user

  before_create :set_user

  def set_user
    self.user_id ||= $user.id
  end

end
