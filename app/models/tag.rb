class Tag < ActiveRecord::Base

  validates_presence_of :name
  has_many :bookmarks_tag
  has_many :bookmarks, :through => :bookmarks_tag
  has_many :notes_tag
  has_many :notes, :through => :notes_tag

  belongs_to :user

  before_create :set_user

  def set_user
    self.user_id ||= User.get_current_user().id
  end

  def self.search(term,bookmark)
    User.get_current_user().tags.where( 'lower(name) LIKE :search', :search => "%#{term}%".downcase ) - bookmark.tags
  end

end
