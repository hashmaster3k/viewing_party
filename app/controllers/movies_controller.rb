class MoviesController < ApplicationController
  def index
    if params[:title]
      response_1 = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&query=#{params[:title]}&page=1&include_adult=false"
      response_2 = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&query=#{params[:title]}&page=2&include_adult=false"
      body_1 = JSON.parse(response_1.body, symbolize_names: true)
      body_2 = JSON.parse(response_2.body, symbolize_names: true)
      @movies = (body_1[:results] << body_2[:results]).flatten
    else
      response_1 = Faraday.get "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}&page=1"
      response_2 = Faraday.get "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}&page=2"
      body_1 = JSON.parse(response_1.body, symbolize_names: true)
      body_2 = JSON.parse(response_2.body, symbolize_names: true)
      @movies = (body_1[:results] << body_2[:results]).flatten
    end
  end
end
