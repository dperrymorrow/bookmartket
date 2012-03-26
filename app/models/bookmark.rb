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
    self.user_id ||= $user.id
  end

  def self.search(search_term)
    marks = $user.bookmarks.where(
                'title LIKE :search OR notes LIKE :search OR url LIKE :search',
                :search => "%#{search_term}%"
                )

    tags = $user.tags.where(  'name LIKE :search', :search => "%#{search_term}%", :include => :bookmarks )
    # TODO: refactor that
    tag_marks = []
    tags.each do |tag|
      tag.bookmarks.each do |bookmark|
        tag_marks << bookmark
      end
    end

    marks.concat(tag_marks)
  end
end

