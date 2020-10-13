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

    it "Display parties the user is host to and has been invited to" do
      @joe = User.create!(email: "joe@gmail.com", password: "12345")
      @bob = User.create!(email: "bob@gmail.com", password: "12345")

      party = Party.create!(movie_id: 1,
                            movie_title: 'Movie',
                            duration: 180,
                            date: "2020-11-03",
                            time: "17:00")
      party1 = Party.create!(movie_id: 2,
                            movie_title: 'Movie1',
                            duration: 200,
                            date: "2020-11-03",
                            time: "12:00")

      UserParty.create!(party_id: party.id, host_id: @bob.id, invitee_id: @joe.id)
      UserParty.create!(party_id: party1.id, host_id: @joe.id, invitee_id: @bob.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@joe)

      visit dashboard_path

      within('.parties') do
        within('.hosting_parties') do
          expect(page).to have_content(party1.movie_title)
          expect(page).to have_content(party1.date_formatted)
          expect(page).to have_content(party1.time_formatted)
          expect(page).to have_content('Hosting')
        end
        within('.invited_parties') do
          expect(page).to have_content(party.movie_title)
          expect(page).to have_content(party.date_formatted)
          expect(page).to have_content(party.time_formatted)
          expect(page).to have_content('Invited')
        end
      end
    end
  end
end
