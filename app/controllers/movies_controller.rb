class MoviesController < ApplicationController
  def index
    if params[:title]
      @movies = MovieFacade.search_by_title(params[:title])
    else
      @movies = MovieFacade.top_40
    end
  end

  def show
    response = Faraday.get "https://api.themoviedb.org/3/movie/#{params[:id]}?api_key=#{ENV['TMDB_API_KEY']}&language=en-US"
    @movie = JSON.parse(response.body, symbolize_names: true)

    response = Faraday.get "https://api.themoviedb.org/3/movie/#{params[:id]}/reviews?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&page=1"
    reviews = JSON.parse(response.body, symbolize_names: true)
    @reviews = reviews[:results]

    response = Faraday.get "https://api.themoviedb.org/3/movie/#{params[:id]}/credits?api_key=#{ENV['TMDB_API_KEY']}"
    credits = JSON.parse(response.body, symbolize_names: true)
    @cast = credits[:cast]
  end
end
