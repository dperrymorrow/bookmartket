class Bookmark < ActiveRecord::Base

  before_create :set_domain


  def set_domain
    if self.url.present?
      self.domain = self.url.split('://')[1].split('/')[0]
    end
  end

end
