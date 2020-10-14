class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Friend', dependent: :destroy, inverse_of: :follower
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: 'Friend', dependent: :destroy, inverse_of: :followee
  has_many :followers, through: :following_users

  has_secure_password

  enum role: { user: 0 }

  def humanize_username
    email.split('@').first
  end

  def hosted_parties
    Party.joins(:user_parties).where('user_parties.host_id = ?', id).distinct
  end

  def invited_parties
    Party.joins(:user_parties).where('user_parties.invitee_id = ?', id)
  end
end
