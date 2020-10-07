require 'rails_helper'

RSpec.describe 'CREATE SESSION' do
  before :each do
    @user = User.create!(email: 'user@test.com', password: '123')
  end

  describe 'a user' do
    it 'can log in and see their dashboard' do
      visit '/'

      within("#login") do
        fill_in :email, with: @user.email
        fill_in :password, with: @user.password
        click_button 'Sign In'
      end

      expect(current_path).to eq(dashboard_path)
    end

    it 'gets an error with wrong email' do
      visit '/'

      within("#login") do
        fill_in :email, with: 'boogy@user.com'
        fill_in :password, with: @user.password
        click_button 'Sign In'
      end

      expect(page).to have_content('Credentials are incorrect')
    end

    it 'gets an error with wrong password' do
      visit '/'

      within("#login") do
        fill_in :email, with: @user.email
        fill_in :password, with: '1233332'
        click_button 'Sign In'
      end

      expect(page).to have_content('Credentials are incorrect')
    end
  end
end
