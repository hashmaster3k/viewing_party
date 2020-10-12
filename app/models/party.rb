class Party < ApplicationRecord
  has_many :user_parties
  validates_presence_of :movie_id, :movie_title, :duration, :date, :time
end
