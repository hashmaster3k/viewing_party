require 'rails helper'

RSpec.describe "Create a new party" do
  before :each do
    @user = User.create!(email: 'email@gmail.com', password: '12345')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  
  describe "As a user" do
    describe "When the user visits the new viewing party page can create a party" do
      
    end
  end
end