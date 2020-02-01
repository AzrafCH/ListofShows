class User < ActiveRecord::Base
  has_secure_password
  has_many :lists, through :shows
  has_many :shows
end
