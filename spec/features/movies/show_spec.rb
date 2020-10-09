require 'rails_helper'

# RSpec.describe "Movies Show Page" do
#   describe "As a user" do
#     before :each do
#       @user = User.create!(email: 'email@gmail.com', password: '12345')
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
#     end

#     it 'Displays selected movie' do
#       visit movie_path
#       find(selector) eq.('Create a Viewing Party')
#       click_link 'Create a Viewing Party'
#       expect(current_path).to eq('/movies')

#       within(".movie_container") do
#         expect(page).to have_css(".title")
#         name = find(".title").text
#         expect(name).to_not be_empty

#         expect(page).to have_css(".rating")
#         role = find(".rating").text
#         expect(role).to_not be_empty
#       end
#     end
#   end
# end