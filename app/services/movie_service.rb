class MovieService
  def self.top_40
    body1 = get_end_point('movie/top_rated', 1)
    body2 = get_end_point('movie/top_rated', 2)
    [body1, body2]
  end

  def self.now_playing
    get_end_point('movie/now_playing', 1)
  end

  def self.search_by_title(title)
    body1 = get_end_point('search/movie', 1, title)
    body2 = get_end_point('search/movie', 2, title)
    [body1, body2]
  end

  def self.movie_details(id)
    get_end_point("movie/#{id}", 0, '', 'credits,reviews,similar')
  end

  private_class_method def self.get_end_point(path, page = 0, query = '', append = '')
    url = "https://api.themoviedb.org/3/#{path}?api_key=#{ENV['TMDB_API_KEY']}"
    url += "&append_to_response=#{append}" unless append.empty?
    url += "&page=#{page}" unless page.zero?
    url += "&query=#{query}&include_adult=false" unless query.empty?
    response = Faraday.get url
    JSON.parse(response.body, symbolize_names: true)
  end
end
