require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end

  describe "Relationships" do
    it { should have_many(:followees).through(:followed_users) }
    it { should have_many(:followers).through(:following_users) }
    it { should have_many :followed_users }
    it { should have_many :following_users }
  end

  describe "Instance Methods" do
    it "#humanize_username" do
      @user = User.create!(email: "longname@gmail.com", password: "12345")

      expect(@user.humanize_username).to eq('longname')
    end
  end
end
