require 'rails_helper'

RSpec.describe "Movies Show Page" do
  describe "A user" do
    before :each do
      @user = User.create!(email: 'email@gmail.com', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it 'displays movie information' do
      VCR.use_cassette('Top rated movies') do
        visit discover_index_path
        click_button('Find Top Rated Movies')

        VCR.use_cassette('Movie details') do
          within(first(".movie")) do
            click_link
          end

          within ".title-and-view-button" do
            title = find(".title").text
            expect(title).to_not be_empty
          end

          within ".stats" do
            vote = find(".vote").text
            expect(vote).to_not be_empty
          end

          within ".stats" do
            runtime = find(".runtime").text
            expect(runtime).to_not be_empty
          end

          within ".stats" do
            genres = find(".genres").text
            expect(genres).to_not be_empty
          end

          within ".summary" do
            expect(page).to have_content('Summary')
            summary = find("p").text
            expect(summary).to_not be_empty
          end

          within ".cast-list" do
            expect(page).to have_css(".cast-person", count: 9)
            cast = find(".cast-left").text
            expect(cast).to_not be_empty
            cast = find(".cast-right").text
            expect(cast).to_not be_empty
          end

          within ".reviews" do
            expect(page).to have_content('Reviews')
          end
        end
      end
    end
  end
end
