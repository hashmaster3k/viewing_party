require 'rails_helper'

RSpec.describe "User Dashboard" do
  before :each do
    @user = User.create!(email: 'email@gmail.com', password: '12345')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe "As a user when I visit dashboard" do
    it "Displays a 'discover movies' button,'friends' and 'parties' sections" do
      visit user_dashboard_path

      expect(page).to have_content("Welcome #{@user.humanize_username}!")
      expect(page).to have_button("Discover Movies")
      expect(page).to have_content("Friends Section")
      expect(page).to have_content("Viewing Parties Section")
    end
  end
end