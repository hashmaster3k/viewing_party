class MoviesController < ApplicationController
  def index
    @movies =
      if params[:title]
        MovieFacade.search_by_title(params[:title])
      else
        MovieFacade.top_40
      end
  end

  def show
    @movie = MovieFacade.movie_details(params[:id])
  end
end
