require 'rails_helper'

RSpec.describe 'as a visitor' do
  describe 'when I visit the records index' do

    before(:each) do
      @artist = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
      @record1 = Record.create!(title: "My Aim Is True", genre: 'Rock', used: false, year: 1977, artist_id: @artist.id)
      @record2 = Record.create!(title: "Bob Dylan", genre: 'Folk', used: false, year: 1962, artist_id: @artist.id)
    end

    it 'see all the records and their attributes' do
      visit "/records"

      expect(page).to have_content(@record1.title)
      expect(page).to have_content(@record1.genre)
      expect(page).to have_content(@record2.used)
      expect(page).to have_content(@record2.year)
      expect(page).to have_content(@record2.artist_id)
    end
  end
end
