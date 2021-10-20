require 'rails_helper'

#US1
RSpec.describe 'the artists show page' do
  describe 'visitor sees' do
    it 'user story 1: displays the artist names' do
      artist = Artist.create(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
      visit "/artists"

      expect(page).to have_content(artist.name)
      expect(page).to have_content(artist.first_name)
      expect(page).to_not have_content(artist.age)
    end
    #US6
    xit 'sorts by most recently created' do

      artist1 = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
      artist2 = Artist.create!(name: 'Costello', first_name: 'Elvis', age: 76, alive: true)

      visit '/artists'

      expect(page). to
    end
  end
  describe 'when visitor visits any page on site' do
    it 'user story 9: every page has a link that takes me back to "/artists"' do
      artist = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
      record1 = Record.create!(title: "My Aim Is True", genre: 'Rock', used: true, year: 1977, artist_id: artist.id)
      record2 = Record.create!(title: "Bob Dylan", genre: 'Folk', used: false, year: 1962, artist_id: artist.id)

      visit "/artists/#{artist.id}"
      expect(page).to have_content("Artist Names")
      click_link ('Artist Names')
      expect(current_path).to eq("/artists")

      visit "/artists/#{artist.id}/records"
      expect(page).to have_content("Artist Names")
      click_link ('Artist Names')
      expect(current_path).to eq("/artists")

      visit "/artists"
      expect(page).to have_content("Artist Names")
      click_link ('Artist Names')
      expect(current_path).to eq("/artists")

      visit "/artists/new"
      expect(page).to have_content("Artist Names")
      click_link ('Artist Names')
      expect(current_path).to eq("/artists")

      visit "/artists/#{artist.id}/edit"
      expect(page).to have_content("Artist Names")
      click_link ('Artist Names')
      expect(current_path).to eq("/artists")
    end
  end
end
