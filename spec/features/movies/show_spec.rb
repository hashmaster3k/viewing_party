require 'rails_helper'

RSpec.describe "Movies Show Page" do
  describe "A user" do
    before :each do
      @user = User.create!(email: 'email@gmail.com', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it 'can click on a movie title and is taken to the movies detail page' do
      visit discover_index_path
      click_button('Find Top Rated Movies')

      within(first(".movie")) do
        click_link
      end

      expect(current_path).to eq("/movies/724089")
    end
  end
end
