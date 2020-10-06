class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true, require: true
  validates :password, presence: true, require: true

  has_secure_password

  enum role: { user: 0 }
end
