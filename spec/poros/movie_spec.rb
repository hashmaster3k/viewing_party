require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    data = {id: 1,
            title: "October Faction",
            vote_average: 8.9}

    movie = Movie.new(data)

    expect(movie).to be_a Movie
    expect(movie.id).to eq(1)
    expect(movie.title).to eq("October Faction")
    expect(movie.vote_average).to eq(8.9)
  end
end
