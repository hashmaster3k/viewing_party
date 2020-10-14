require 'rails_helper'

RSpec.describe 'USER NEW PAGE' do
  describe 'a visitor' do
    it 'can visit the new registration page' do
      visit root_path
      click_link "New to Viewing Party? Register Here"

      expect(current_path).to eq(registration_path)

      expect(page).to have_content("Welcome to Viewing Party")
      expect(page).to have_content("Please Register for an Account")
      expect(page).to have_selector("input[placeholder='Email']")
      expect(page).to have_selector("input[placeholder='Password']")
      expect(page).to have_selector("input[placeholder='Password Confirmation']")
      expect(page).to have_button("Register")

      expect(page).to have_link("Already Registered? Log in Here")
    end

    it 'can fill out form and create an account' do
      visit registration_path

      fill_in :email, with: 'user@test.com'
      fill_in :password, with: '123'
      fill_in :password_confirm, with: '123'
      click_button "Register"

      expect(current_path).to eq(dashboard_path)
    end

    it 'must have matching passwords' do
      visit registration_path

      fill_in :email, with: 'user@test.com'
      fill_in :password, with: '123'
      fill_in :password_confirm, with: '321'
      click_button "Register"

      expect(page).to have_content('Passwords do not match.')
    end

    it 'email must be unique' do
      User.create!(email: 'user@test.com', password: 'akndf')

      visit registration_path

      fill_in :email, with: 'user@test.com'
      fill_in :password, with: '123'
      fill_in :password_confirm, with: '123'
      click_button "Register"

      expect(page).to have_content('Email has already been taken')
    end
  end
end
