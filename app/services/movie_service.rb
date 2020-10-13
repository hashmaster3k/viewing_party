class MovieService
  def self.top_40
    body1 = get_end_point("movie/top_rated", 1)
    body2 = get_end_point("movie/top_rated", 2)
    return body1, body2
  end 

  def self.search_by_title(title)
    body1 = get_end_point("search/movie", 1, title)
    body2 = get_end_point("search/movie", 2, title)
    return body1, body2
  end

  private 

  def self.get_end_point(path, page, query="")
    url = "https://api.themoviedb.org/3/#{path}?api_key=#{ENV['TMDB_API_KEY']}&page=#{page}"
    unless query.empty?
      url += "&query=#{query}&include_adult=false"
    end
    response = Faraday.get url
    JSON.parse(response.body, symbolize_names: true)
  end
end