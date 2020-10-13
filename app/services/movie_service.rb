class MovieService
  def self.top_40
    response1 = Faraday.get "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}&page=1"
    response2 = Faraday.get "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}&page=2"
    body1 = JSON.parse(response1.body, symbolize_names: true)
    body2 = JSON.parse(response2.body, symbolize_names: true)
    return body1, body2
  end

  def self.search_by_title(title)
    response1 = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&query=#{title}&page=1&include_adult=false"
    response2 = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&query=#{title}&page=2&include_adult=false"
    body1 = JSON.parse(response1.body, symbolize_names: true)
    body2 = JSON.parse(response2.body, symbolize_names: true)
    return body1, body2
  end
end