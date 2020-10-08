require 'rails_helper'

RSpec.describe "User Dashboard" do
  before :each do
    @user = User.create!(email: 'email@gmail.com', password: '12345')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe "As a user when I visit dashboard" do
    it "Displays a 'discover movies' button,'friends' and 'parties' sections" do
      visit dashboard_path

      expect(page).to have_content("Welcome #{@user.humanize_username}!")
      expect(page).to have_button("Discover Movies")

      within ".friends" do
        expect(page).to have_content("Friends")
      end

      within ".parties" do
        expect(page).to have_content("Viewing")
      end
    end

    it 'display message when you have no friends' do
      visit dashboard_path

      within ".friends" do
        expect(page).to have_content("You currently have no friends")
      end
    end

    it 'display a box and button to add a friend' do
      visit dashboard_path

      within ".friends" do
        expect(page).to have_selector("input[placeholder='Friends email']")
        expect(page).to have_button('Add Friend')
      end
    end

    it 'can add a friend and will display their name' do
      @nick = User.create!(email: 'nick@gmail.com', password: '12345')

      visit dashboard_path

      within ".friends" do
        fill_in :email, with: @nick.email
        click_button('Add Friend')
      end

      expect(current_path).to eq(dashboard_path)

      within ".friends" do
        expect(page). to have_content('nick')
      end
    end

    it 'cannot add a user that doesnt exit in database' do
      @nick = User.create!(email: 'nick@gmail.com', password: '12345')

      visit dashboard_path

      within ".friends" do
        fill_in :email, with: 'johnny@gmail.com'
        click_button('Add Friend')
      end

      expect(page).to have_content("I'm sorry your friend cannot be found")
    end
  end
end
