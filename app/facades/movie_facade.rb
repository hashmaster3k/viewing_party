class MovieFacade
  def self.top_40
    top_40_movies = MovieService.top_40
    movies = combine_data(top_40_movies)
    convert_to_objects(movies)
  end

  def self.search_by_title(title)
    movie_results = MovieService.search_by_title(title)
    movies = combine_data(movie_results)
    convert_to_objects(movies)
  end

  private
  
  def self.combine_data(data)
    (data.first[:results] << data.second[:results]).flatten
  end

  def self.convert_to_objects(movies)
    movies.map { |movie_data| Movie.new(movie_data) }
  end
end