class User < ActiveRecord::Base
  #attr_accessible :username, :password, :password_confirmation, :password_digest, :token
  #attr_accessor :password, :password_confirmation
  before_create :generate_token
  has_secure_password

  def name
    self.username.blank? ? '空白' : self.username
  end

  private
  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
