class Bookmark < ActiveRecord::Base

  before_create :set_domain
  validates_presence_of :url

  def set_domain
    if self.url.present?
      self.domain = self.url.split('://')[1].split('/')[0]
    end
  end


  def search(key)

  end

end
