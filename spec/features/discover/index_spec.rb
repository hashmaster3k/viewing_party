require 'rails_helper'

RSpec.describe "Discover Index Page" do
  describe "As a user" do
    before :each do
      @user = User.create!(email: 'email@gmail.com', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "Has a button to the discover page from dashboard" do
      visit dashboard_path
      expect(page).to have_button('Discover Movies')
      click_button('Discover Movies')
      expect(current_path).to eq('/discover')
    end

    it "There is button to find to rated movies" do
      visit discover_index_path
      expect(page).to have_button('Find Top Rated Movies')
      click_button('Find Top Rated Movies')
      expect(current_path).to eq('/movies')
    end

  end
end