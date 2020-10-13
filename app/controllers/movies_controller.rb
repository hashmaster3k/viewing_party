class MoviesController < ApplicationController
  def index
    if params[:title]
      @movies = MovieFacade.search_by_title(params[:title])
    else
      @movies = MovieFacade.top_40
    end
  end

  def show
    @movie = MovieFacade.movie_details(params[:id])
  end
end
