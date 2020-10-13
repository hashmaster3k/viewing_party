require 'rails_helper'

RSpec.describe Party do
  describe 'validations' do
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
  end

  describe 'relationships' do
    it { should have_many :user_parties }
  end

  it 'can create a party object' do
    Party.create!(movie_id: 1, movie_title: 'Lego Movie', duration: 180, date: "2020-12-25", time: "17:30")
    expect(Party.count).to eq(1)
  end

  describe 'Instance Methods' do
    before :each do
      @party = Party.create!(movie_id: 1, movie_title: 'Lego Movie', duration: 180, date: "2020-12-25", time: "17:30")
    end

    it '#date_formatted' do
      expect(@party.date_formatted).to eq('December 25, 2020')
    end

    it '#time_formatted PM' do
      expect(@party.time_formatted).to eq('5:30 PM')
    end

    it '#time_formatted AM' do
      @party.time = "3:25"
      expect(@party.time_formatted).to eq('3:25 AM')
    end
  end
end
