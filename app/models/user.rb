class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/
  # Setup accessible (or protected) attributes for your model
  validates_uniqueness_of :username, :email
  attr_accessible :language, :username, :email, :password, :password_confirmation, :remember_me
  has_many :mailstarts
end
