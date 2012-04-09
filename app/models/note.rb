class Note < ActiveRecord::Base

  before_create :set_user

  validates_presence_of :body
  validates_presence_of :title

  belongs_to :user
  has_many :notes_tag
  has_many :tags, :through => :notes_tag

  def set_user
    self.user_id ||= User.get_current_user().id
  end

  def self.search(term)
    notes = User.get_current_user().notes.where( 'lower(title) LIKE :search OR lower(body) LIKE :search', :search => "%#{term}%".downcase )
    tags = User.get_current_user().tags.where( 'lower(name) LIKE :search', :search => "%#{term}%".downcase, :include => :notes )

    tag_notes = []

    tags.each do |tag|
      tag.notes.each do |note|
        tag_notes << note
      end
    end

    notes.concat(tag_notes)
  end

end