class MovieDetail
  attr_reader :id,
              :title,
              :genres,
              :vote_average,
              :runtime,
              :vote_average,
              :overview,
              :cast,
              :reviews
              
  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @genres = data[:genres]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @overview = data[:overview]
    @cast = data[:credits][:cast]
    @reviews = data[:reviews][:results]
  end
end
