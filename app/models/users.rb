class User < ActiveRecord::Base
  has_secure_password
  has_many :shows, through: :lists
  has_many :lists
end
