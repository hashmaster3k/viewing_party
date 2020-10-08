class MoviesController < ApplicationController
  def index
    if params[:search]

    else
      response_1 = Faraday.get "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}&page=1"
      response_2 = Faraday.get "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}&page=2"
      body_1 = JSON.parse(response_1.body, symbolize_names: true)
      body_2 = JSON.parse(response_2.body, symbolize_names: true)
      @top_40 = (body_1[:results] << body_2[:results]).flatten
    end
  end
end
