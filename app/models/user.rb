require 'digest/sha1'

class User < ActiveRecord::Base

  SALT = 'd53p918702l'
  has_many :bookmarks
  has_many :tags
  before_save :generate_hash, :encrypt_password

  validates :email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password
  validates_length_of :password, :minimum => 5

  @@current_user = nil

  def self.set_current_user(user)
    @@current_user = user
  end

  def self.get_current_user
    @@current_user
  end

  def generate_hash
    self.api_key = rand(36**15).to_s(36).upcase
  end

  def encrypt_password
    self.password = User.encrypt(self.password)
  end

  def self.login_attempt(email,password)
    User.where(:email => email, :password => User.encrypt(password)).first()
  end

  def self.encrypt(str)
    Digest::SHA1.hexdigest( str + SALT )
  end

end
