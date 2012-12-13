class Tag < ActiveRecord::Base

  validates_presence_of :name
  has_many :bookmarks_tag, :dependent => :destroy
  has_many :bookmarks, :through => :bookmarks_tag, :dependent => :destroy
  has_many :notes_tag, :dependent => :destroy
  has_many :notes, :through => :notes_tag, :dependent => :destroy

  belongs_to :user
  before_create :set_user

  def set_user
    self.user_id ||= User.get_current_user().id
  end

  def self.search(term,bookmark)
    User.get_current_user().tags.where( 'lower(name) LIKE :search', :search => "%#{term}%".downcase ) - bookmark.tags
  end

end
