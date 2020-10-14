require "rails_helper"

RSpec.describe MovieDetail do
  it "exists" do
    data = {id: 1,
            title: 'October Faction',
            vote_average: 8.9,
            genres: [name: 'Action'],
            runtime: 180,
            overview: 'Sub Movie',
            credits: {cast: []},
            reviews: {results: []},
            similar: {results:[]}}

    movie = MovieDetail.new(data)

    expect(movie).to be_a(MovieDetail)
    expect(movie.id).to be_an(Integer)
    expect(movie.title).to be_a(String)
    expect(movie.vote_average).to be_an(Float)
    expect(movie.genres).to be_an(Array)
    expect(movie.runtime).to be_an(Integer)
    expect(movie.overview).to be_a(String)
    expect(movie.cast).to be_an(Array)
    expect(movie.reviews).to be_an(Array)
    expect(movie.similar).to be_an(Array)
  end
end
