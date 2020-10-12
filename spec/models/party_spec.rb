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
    Party.create!(movie_id: 1, movie_title: 'Lego Movie', duration: 180, date: "#{Date.today}", time: "#{Time.now}")
    expect(Party.count).to eq(1)
  end
end
