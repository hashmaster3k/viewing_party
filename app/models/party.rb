class Party < ApplicationRecord
  has_many :user_parties, dependent: :destroy
  validates :movie_id, :movie_title, :duration, :date, :time, presence: true
end
