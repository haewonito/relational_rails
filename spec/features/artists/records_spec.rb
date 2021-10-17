require 'rails_helper'

RSpec.describe 'as a visitor' do
  describe 'when I visit the records show' do

    before(:each) do
      @artist1 = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
      @record1 = Record.create!(title: "My Aim Is True", genre: 'Rock', used: false, year: 1977, artist_id: @artist1.id)
      @record2 = Record.create!(title: "Bob Dylan", genre: 'Folk', used: false, year: 1962, artist_id: @artist1.id)

      @artist2 = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
      @record3 = Record.create!(title: "Almost Blue", genre: 'Folk', used: true, year: 1981, artist_id: @artist2.id)
    end

    it 'see all the attributes belonging to that record' do
      visit "/artists/#{@artist1.id}/records"

      expect(page).to have_content(@record1.title)
      expect(page).to have_content(@record1.genre)
      expect(page).to have_content(@record1.used)
      expect(page).to have_content(@record2.year)
      expect(page).to have_content(@record2.artist_id)

      expect(page).to_not have_content(@record3.title)
      expect(page).to_not have_content(@record3.genre)
      expect(page).to_not have_content(@record3.used)
      expect(page).to_not have_content(@record3.year)
      expect(page).to_not have_content(@record3.artist_id)
    end
  end

end
