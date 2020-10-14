require 'rails_helper'

describe MovieService do
  it "returns array of two lists for top 40" do
    VCR.use_cassette('Top rated movies') do
      movie_list = MovieService.top_40
      expect(movie_list).to be_a(Array)
      expect(movie_list.first).to be_a(Hash)
      expect(movie_list.second).to be_a(Hash)

      expect(movie_list.first[:results]).to be_an(Array)
      movie_data = movie_list.first[:results]

      expect(movie_data.first).to have_key :title
      expect(movie_data.first[:title]).to be_a(String)

      expect(movie_data.first).to have_key :id
      expect(movie_data.first[:id]).to be_a(Integer)

      expect(movie_data.first).to have_key :vote_average
      expect(movie_data.first[:vote_average]).to be_a(Float)
    end
  end

  it "returns array of two lists for search by title" do
    VCR.use_cassette('Movie Search Phoenix') do
      movie_list = MovieService.search_by_title('Phoenix')
      expect(movie_list).to be_a(Array)
      expect(movie_list.first).to be_a(Hash)
      expect(movie_list.second).to be_a(Hash)

      expect(movie_list.first[:results]).to be_an(Array)
      movie_data = movie_list.first[:results]

      expect(movie_data.first).to have_key :title
      expect(movie_data.first[:title]).to be_a(String)

      expect(movie_data.first).to have_key :id
      expect(movie_data.first[:id]).to be_a(Integer)

      expect(movie_data.first).to have_key :vote_average
      expect(movie_data.first[:vote_average]).to be_a(Float)
    end
  end

  it "returns hash of specifc movie info" do
    VCR.use_cassette('Movie details') do
      movie_details = MovieService.movie_details(724089)

      expect(movie_details).to be_a(Hash)

      expect(movie_details).to have_key :title
      expect(movie_details[:title]).to be_a(String)

      expect(movie_details).to have_key :id
      expect(movie_details[:id]).to be_a(Integer)

      expect(movie_details).to have_key :vote_average
      expect(movie_details[:vote_average]).to be_a(Float)

      expect(movie_details).to have_key :runtime
      expect(movie_details[:runtime]).to be_a(Integer)

      expect(movie_details).to have_key :genres
      expect(movie_details[:genres]).to be_a(Array)

      expect(movie_details).to have_key :overview
      expect(movie_details[:overview]).to be_a(String)

      expect(movie_details).to have_key :credits
      expect(movie_details[:credits][:cast]).to be_a(Array)

      expect(movie_details).to have_key :reviews
      expect(movie_details[:reviews][:results]).to be_a(Array)
    end
  end
end
