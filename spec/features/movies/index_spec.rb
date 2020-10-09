require 'rails_helper'

RSpec.describe "Movies Index Page" do
  describe "As a user" do
    before :each do
      @user = User.create!(email: 'email@gmail.com', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it 'displays top_40 movies' do
      visit discover_index_path
      click_button 'Find Top Rated Movies'
      expect(current_path).to eq('/movies')
      
      expect(page).to have_css(".movie", count: 40)
      within(first(".movie")) do
        expect(page).to have_css(".title")
        name = find(".title").text
        expect(name).to_not be_empty

        expect(page).to have_css(".rating")
        role = find(".rating").text
        expect(role).to_not be_empty
      end
    end

    it "Returns movie based on search suggestion. Movie title is a link" do
      visit discover_index_path
      within('.search_movie_form') do
        fill_in :title, with: 'Phoenix'
        click_button 'Find Movies'
      end
      expect(current_path).to eq('/movies')

      expect(page).to have_css(".movie", count: 40)

      within(first(".movie")) do
        expect(page).to have_css(".title")
        name = find(".title").text
        expect(page).to have_link(name)
        expect(name.include?('Phoenix')).to eq(true)
        expect(name).to_not be_empty

        expect(page).to have_css(".rating")
        role = find(".rating").text
        expect(role).to_not be_empty
      end
    end

  end
end

### ===== Notes
# We need to test for 'search by title' function
# We need to test for a link on each movie title that routes to the movie's show page