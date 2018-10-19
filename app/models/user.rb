class User < ApplicationRecord
  has_secure_password
  has_one :profile
  has_one_attached :avatar

  validates :username, uniqueness: {
    case_sensitive: false
  }
end
