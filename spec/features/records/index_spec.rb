require 'rails_helper'

#US3 & US 15
RSpec.describe 'as a visitor' do
  describe 'when I visit the records index' do
    it 'see all the records and their attributes' do

      artist = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
      record1 = Record.create!(title: "My Aim Is True", genre: 'Rock', used: true, year: 1977, artist_id: artist.id)
      record2 = Record.create!(title: "Bob Dylan", genre: 'Folk', used: true, year: 1962, artist_id: artist.id)

      visit "/records"

      expect(page).to have_content(record1.title)
      expect(page).to have_content(record1.genre)
      expect(page).to have_content(record2.used)
      expect(page).to have_content(record2.year)
      expect(page).to have_content(record2.artist_id)
    end

    it 'see only the records that is used' do

      artist = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
      record1 = Record.create!(title: "My Aim Is True", genre: 'Rock', used: true, year: 1977, artist_id: artist.id)
      record2 = Record.create!(title: "Bob Dylan", genre: 'Folk', used: false, year: 1962, artist_id: artist.id)

      visit "/records"

      expect(page).to have_content(record1.title)
      expect(page).to have_content(record1.genre)
      expect(page).to have_content(record1.used)
      expect(page).to have_content(record1.year)
      expect(page).to_not have_content(record2.genre)
      expect(page).to_not have_content(record2.title)


    end
  end
  describe 'when I visit any page on site' do
    it 'user story 8: every page has a link that takes me back to "/records"' do
      artist = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
      record1 = Record.create!(title: "My Aim Is True", genre: 'Rock', used: true, year: 1977, artist_id: artist.id)
      record2 = Record.create!(title: "Bob Dylan", genre: 'Folk', used: false, year: 1962, artist_id: artist.id)

      visit "/artists/#{artist.id}"
      expect(page).to have_content("All Records")
      click_link ('All Records')
      expect(current_path).to eq("/records")

      visit "/artists/#{artist.id}/records"
      expect(page).to have_content("All Records")
      click_link ('All Records')
      expect(current_path).to eq("/records")

      visit "/artists"
      expect(page).to have_content("All Records")
      click_link ('All Records')
      expect(current_path).to eq("/records")

      visit "/artists/new"
      expect(page).to have_content("All Records")
      click_link ('All Records')
      expect(current_path).to eq("/records")

      visit "/artists/#{artist.id}/edit"
      expect(page).to have_content("All Records")
      click_link ('All Records')
      expect(current_path).to eq("/records")
    end
  end
end
