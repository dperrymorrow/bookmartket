class Bookmark < ActiveRecord::Base

  before_create :set_domain, :set_user

  validates_presence_of :url
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates_uniqueness_of :url, :scope => :user_id

  belongs_to :user
  has_many :bookmarks_tag
  has_many :tags, :through => :bookmarks_tag

  def set_domain
    if self.url.present?
      self.domain = self.url.split('://')[1].split('/')[0]
    end
  end

  def set_user
    self.user_id ||= User.get_current_user().id
  end

  def self.search(search_term)

    marks = User.get_current_user().bookmarks.where( 'lower(title) LIKE :search OR lower(notes) LIKE :search OR lower(url) LIKE :search', :search => "%#{search_term}%".downcase )
    tags = User.get_current_user().tags.where( 'lower(name) LIKE :search', :search => "%#{search_term}%".downcase, :include => :bookmarks )

    tag_marks = []

    tags.each do |tag|
      tag.bookmarks.each do |bookmark|
        tag_marks << bookmark
      end
    end

    marks.concat(tag_marks)
  end
end

