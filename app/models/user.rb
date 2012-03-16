require 'digest/md5'

class User < ActiveRecord::Base

  has_many :bookmarks
  before_save :generate_hash

  validates :email, :presence => true,
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  validates_presence_of :password
  validates_length_of :password, :minimum => 5


  def generate_hash
    self.api_key = rand(36**15).to_s(36).upcase
  end

end
