class Movie
  attr_reader :title, :id, :vote_average, :poster
  def initialize(data)
    @title = data[:title]
    @id = data[:id]
    @vote_average = data[:vote_average]
    @poster = data[:poster_path]
  end
end
