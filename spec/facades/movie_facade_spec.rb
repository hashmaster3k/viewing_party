require 'rails_helper'

RSpec.describe 'Movie Facade' do
  it 'returns a list of top 40 rated movies' do
    VCR.use_cassette('Top rated movies') do
      movies = MovieFacade.top_40

      expect(movies).to be_an(Array)
      expect(movies.first).to be_a(Movie)
      expect(movies.first.title).to be_a(String)
    end
  end

  it 'returns a list of 40 movies that match a search' do
    VCR.use_cassette('Movie Search Phoenix') do
      movies = MovieFacade.search_by_title('Phoenix')

      expect(movies).to be_an(Array)
      expect(movies.first).to be_a(Movie)
      expect(movies.first.title).to be_a(String)
    end
  end

  it 'returns a movie object with lots of details' do
    VCR.use_cassette('Movie details') do
      movie = MovieFacade.movie_details(724089)

      expect(movie).to be_a(MovieDetail)
      expect(movie.id).to be_an(Integer)
      expect(movie.title).to be_a(String)
      expect(movie.vote_average).to be_an(Float)
      expect(movie.genres).to be_an(Array)
      expect(movie.runtime).to be_an(Integer)
      expect(movie.overview).to be_a(String)
      expect(movie.cast).to be_an(Array)
      expect(movie.reviews).to be_an(Array)
    end
  end

  it 'can combine results of two pages into one' do
    data = [{results: []},{results: []}]
    expected = []
    expect(MovieFacade.combine_data(data)).to eq(expected)
  end

  it 'can convert a list to object' do
    movies = [{id: 1, title: 'Woo', vote_average: 5},
              {id: 2, title: 'Moo', vote_average: 6}]
    movie_objects = MovieFacade.convert_to_objects(movies)

    expect(movie_objects).to be_an(Array)
    expect(movie_objects.first).to be_a(Movie)
    expect(movie_objects.second).to be_a(Movie)
  end
end
