require 'rails_helper'

RSpec.describe 'as a visitor' do
  describe 'when I visit the records show' do

    before(:each) do
      @artist = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
      @record1 = Record.create!(title: "My Aim Is True", genre: 'Rock', used: false, year: 1977, artist_id: @artist.id)
      @record2 = Record.create!(title: "Bob Dylan", genre: 'Folk', used: false, year: 1962, artist_id: @artist.id)
    end

    it 'see all the attributes belonging to that record' do
      visit "/records/#{@record1.id}"

      expect(page).to have_content(@record1.title)
      expect(page).to have_content(@record1.genre)
      expect(page).to have_content(@record1.used)
      expect(page).to have_content(@record1.year)
      expect(page).to have_content(@record1.artist_id)
      expect(page).to_not have_content(@record2.title)

    end
  end
end
