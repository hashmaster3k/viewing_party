class Party < ApplicationRecord
  has_many :user_parties, dependent: :destroy
  validates :movie_id, :movie_title, :duration, :date, :time, presence: true

  def date_formatted
    split = date.split('-')
    date_object = Date.new(split.first.to_i, split.second.to_i, split.third.to_i)
    date_object.strftime("%B %d, %Y")
  end

  def time_formatted
    if time.to_i <= 12
      "#{time} AM"
    else
      split = time.split(':')
      hour = split.first.to_i - 12
      minute = split.second
      "#{hour}:#{minute} PM"
    end
  end
end
