class Bookmark < ActiveRecord::Base

  before_create :set_domain, :set_user

  validates_presence_of :title, :message => 'Everybody needs a name.'
  validates_presence_of :url
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates_uniqueness_of :url, :scope => :user_id, :message => "You already got that one."
  validates_length_of [:notes,:title,:url], :maximum => 140

  belongs_to :user
  has_many :bookmarks_tag, :dependent => :destroy
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

    filtered = []

    tags.each do |tag|
      tag.bookmarks.each do |bookmark|
        filtered << bookmark if !filtered.include? bookmark
      end
    end

    marks.each do |bookmark|
      filtered << bookmark if !filtered.include? bookmark
    end
    
    filtered
    
  end
end

