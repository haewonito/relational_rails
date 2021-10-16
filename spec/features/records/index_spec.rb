require 'rails_helper'

RSpec.describe 'as a visitor' do
  describe 'when I visit the records index' do

    before(:each) do
      @artist = Artist.create(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
      @record = Record.create(title: "My Aim Is True", genre: 'Rock', used: false, year: 1977, artist_id: @artist.id)
    end

    it 'see all the records and their attributes' do
      visit "/"
    end
  end
end
