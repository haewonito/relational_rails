# need to fix!!!  Haven't ran it
# US18
require 'rails_helper'

RSpec.describe 'this artist edit' do

  describe "user story 12" do
    it 'can edit artists' do
      artist = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)

      visit "/artists/#{artist.id}"
      click_link "Update Artist"

      expect(current_path).to eq("/artists/#{artist.id}/edit")

      fill_in 'artist[name]', with: 'Prince'
      click_button 'Edit Artist'

      expect(current_path).to eq("/artists/#{artist.id}")
      expect(page).to have_content('Prince')
      expect(page).to have_content('66')
      expect(page).to_not have_content('McDowell')
    end
  end

  describe "user story 18" do
    xit 'links to the edit page' do
      artist = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)

      visit '/artists'

      click_button "Edit #{artist.name}"

      expect(current_path).to eq("/artists/#{artist.id}/edit")
    end

    xit 'can edit the artist' do
      artist = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)

      visit "/artists/#{artist.id}/edit"

      expect(page).to have_content('McDowell')

      fill_in 'artist[name]', with: 'Prince'
      click_button 'Update Artist'

      expect(current_path). to eq('/artists')
      expect(page).to have_content('Prince')
    end
  end
end
