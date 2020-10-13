require 'rails_helper'

RSpec.describe "Create a new party" do
  before :each do
    @joe = User.create!(email: 'joe@gmail.com', password: '12345')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@joe)
  end

  describe "As a user" do
    describe "When the user visits the new viewing party page can create a party" do
      it "Discover movies page has a link to create a party" do
        VCR.use_cassette( 'Top rated movies' ) do
          visit discover_index_path
          click_button "Find Top Rated Movies"

          within(first(".movie")) do
            click_link
          end

          click_button("Create Viewing Party for Movie")
          expect(current_path).to eq(new_party_path)
        end
      end

      it "New parties page has a form to create one, with movie title, duration, date, time, and friends to invite" do
        VCR.use_cassette( 'Top rated movies' ) do

          visit discover_index_path
          click_button "Find Top Rated Movies"
          within(first(".movie")) do
            click_link
          end
          click_button("Create Viewing Party for Movie")

          expect(page).to have_content("Movie Title")
          expect(page).to have_content("Duration of Party")
          expect(page).to have_content("Day")
          expect(page).to have_content("Start Time")
          expect(page).to have_content("Include")
          expect(page).to have_content("You have no friends")
          expect(page).to have_selector("input[name= 'movie_title']")
          expect(page).to have_selector("input[name= 'duration']")
          expect(page).to have_selector("input[name= 'date']")
          expect(page).to have_selector("input[name= 'time']")
        end
      end

      it 'can create a new viewing party' do
        VCR.use_cassette( 'Top rated movies' ) do
          @bob = User.create!(email: 'bob@gmail.com', password: '12345')
          @joe.followers << @bob

          visit discover_index_path
          click_button "Find Top Rated Movies"
          within(first(".movie")) do
            click_link
          end
          click_button("Create Viewing Party for Movie")
          fill_in :duration, with: 115
          fill_in :date, with: Date.today
          fill_in :time, with: Time.now
          within "#friend-#{@bob.id}" do
            check
          end

          click_button("Create Party")
          expect(current_path).to eq(dashboard_path)
        end
      end
    end
  end
end
