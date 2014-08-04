class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable
  attr_accessible :username, :email, :password, :password_confirmation

  validates :username, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: { minimum: 6, maximum: 40 }

  THEMES = ['Default', 'Inaba', 'Chitoge', 'Akatsuki', '']

  def self.find_for_authentication(tainted_conditions)

    conditions = tainted_conditions.dup
    p conditions
    where(conditions).first
  end

  def name
    self.username.blank? ? '空白' : self.username
  end



end
