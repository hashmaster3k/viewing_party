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
  end
end
