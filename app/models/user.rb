class User < ActiveRecord::Base
  has_many :shows
  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true
end
