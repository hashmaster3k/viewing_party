require 'rails_helper'

RSpec.describe "Create a new party" do
  before :each do
    @user = User.create!(email: 'email@gmail.com', password: '12345')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
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
    end
  end
end