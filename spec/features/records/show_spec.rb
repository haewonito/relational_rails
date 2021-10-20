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

  describe 'when I press the delete key' do
    it 'user story 20: deletes artist shown along w/ all hikers associated linked to the mountain' do
      artist1 = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: true)
      artist2 = Artist.create!(name: 'Costello', first_name: 'Elvis', age: 76, alive: true)

      record1 = Record.create!(title: "Bob Dylan", genre: 'Folk', used: false, year: 1962, artist_id: artist1.id)
      record2 = Record.create!(title: "The Freewheelin'", genre: 'Folk', used: true, year: 1963, artist_id: artist1.id)
      record3 = Record.create!(title: "Another Side Of", genre: 'Folk', used: false, year: 1964, artist_id: artist1.id)

      visit "/records/#{record1.id}"

      click_link('Delete Record')

      expect(current_path).to eq('/records')

      expect(page).to_not have_content(record1.title)
      expect(page).to_not have_content(record1.used)
      expect(page).to_not have_content(record1.year)

      expect(page).to_not have_content(record1.used)
      expect(page).to_not have_content(record1.title)

    end
  end


end
