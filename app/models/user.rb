class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_secure_password

  enum role: { user: 0 }

  def humanize_username
    email.split('@').first
  end
end
