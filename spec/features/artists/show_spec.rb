require 'rails_helper'

RSpec.describe 'the artists show page' do

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
