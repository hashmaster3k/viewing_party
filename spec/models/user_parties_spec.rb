require 'rails_helper'

RSpec.describe UserParty do
  describe 'validations' do
    it { should validate_presence_of :host_id }
    it { should validate_presence_of :invitee_id }
  end

  describe 'relationships' do
    it { should belong_to :party }
  end

  it 'can create a user party' do
    @joe = User.create!(email: "joe@gmail.com", password: "12345")
    @bob = User.create!(email: "bob@gmail.com", password: "12345")
    @party = Party.create!(movie_id: 1, movie_title: 'Lego Movie', duration: 180, date: "#{Date.today}", time: "#{Time.now}")
    UserParty.create!(party_id: @party.id, host_id: @joe.id, invitee_id: @bob.id)
    expect(UserParty.count).to eq(1)
  end
end
