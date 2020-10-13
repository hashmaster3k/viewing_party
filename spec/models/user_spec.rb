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
    before :each do
      @joe = User.create!(email: "joe@gmail.com", password: "12345")
      @bob = User.create!(email: "bob@gmail.com", password: "12345")
    end

    it "#humanize_username" do
      expect(@joe.humanize_username).to eq('joe')
    end

    it '#hosted_parties' do
      party = Party.create!(movie_id: 1,
                            movie_title: 'Movie',
                            duration: 180,
                            date: "#{Date.today}",
                            time: "#{Time.now}")

      UserParty.create!(party_id: party.id, host_id: @joe.id, invitee_id: 0)

      expect(@joe.hosted_parties.count).to eq(1)
      expect(@joe.hosted_parties.first.class).to eq(Party)
    end

    it '#invited_parties' do
      party = Party.create!(movie_id: 1,
                            movie_title: 'Movie',
                            duration: 180,
                            date: "#{Date.today}",
                            time: "#{Time.now}")

      UserParty.create!(party_id: party.id, host_id: @bob.id, invitee_id: @joe.id)

      expect(@joe.invited_parties.count).to eq(1)
      expect(@joe.invited_parties.first.class).to eq(Party)
    end
  end
end
