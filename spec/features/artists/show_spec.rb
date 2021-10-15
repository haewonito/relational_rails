require 'rails_helper'

RSpec.describe 'the artists show page' do
  it 'user story 1: displays the artist names' do
    artist = Artist.create(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
    visit "/artists"
  end

#     As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

  it 'user story 2: displays the parent with id, with all its attributes' do
    artist = Artist.create(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
    visit "/artists/#{artist.id}"

    expect(page).to have_content(artist.id)
    expect(page).to have_content(artist.alive)
    expect(page).to have_content(artist.name)
    expect(page).to have_content(artist.first_name)
    expect(page).to have_content(artist.age)
    expect(page).to have_content(artist.created_at)

  end
end
