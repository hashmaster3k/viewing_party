class DiscoverController < ApplicationController
  def index
    @upcoming_movies = MovieFacade.upcoming_movies
  end
end
