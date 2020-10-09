class MoviesController < ApplicationController
  def index
    if params[:title]
      response1 = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&query=#{params[:title]}&page=1&include_adult=false"
      response2 = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&query=#{params[:title]}&page=2&include_adult=false"
      body1 = JSON.parse(response1.body, symbolize_names: true)
      body2 = JSON.parse(response2.body, symbolize_names: true)
      @movies = (body1[:results] << body2[:results]).flatten
    else
      response1 = Faraday.get "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}&page=1"
      response2 = Faraday.get "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}&page=2"
      body1 = JSON.parse(response1.body, symbolize_names: true)
      body2 = JSON.parse(response2.body, symbolize_names: true)
      @movies = (body1[:results] << body2[:results]).flatten
    end
  end
end
