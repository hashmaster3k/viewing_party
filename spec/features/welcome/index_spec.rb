require 'rails_helper'

RSpec.describe "Welcome Index Page" do
  describe "As a visitor" do
    it "Visit the home page and sees welcome message, button to login and registration link" do
      visit root_path

      expect(page).to have_content("Welcome to Viewing Party")
      expect(page).to have_content("An app to watch movies with your friends")

      within("#login") do
        expect(page).to have_selector("input[placeholder='Email']")
        expect(page).to have_selector("input[placeholder='Password']")
        expect(page).to have_button("Sign In")
      end

      expect(page).to have_link("New to Viewing Party? Register Here")
    end
  end
end
