class Note < ActiveRecord::Base
  
  markdownize! :body, :line_numbers => :table
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

    filtered = []

    tags.each do |tag|
      tag.notes.each do |note|
        filtered << note if !filtered.include? note
      end
    end
    
    notes.each do |note|
      filtered << note if !filtered.include? note
    end
    
    filtered
  end

end