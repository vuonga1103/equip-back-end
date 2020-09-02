class User < ApplicationRecord
  has_many :items
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }
end
