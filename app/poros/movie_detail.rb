class MovieDetail
  attr_reader :id,
              :title,
              :genres,
              :vote_average,
              :runtime,
              :overview,
              :cast,
              :reviews,
              :image,
              :similar

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @genres = data[:genres]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @overview = data[:overview]
    @cast = data[:credits][:cast]
    @reviews = data[:reviews][:results]
    @image = data[:backdrop_path]
    @similar = data[:similar][:results][0..4]
  end

  def runtime_formatted
    hour = runtime / 60
    minutes = runtime % 60
    "#{hour} hr #{minutes} min"
  end
end
