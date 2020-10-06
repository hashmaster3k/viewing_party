require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end

  describe "Instance Methods" do
    it "#humanize_username" do
      @user = User.create!(email: "longname@gmail.com", password: "12345")
      
      expect(@user.humanize_username).to eq('longname')
    end
  end
end
