require 'rails_helper'

RSpec.describe 'the artists show page' do
#US2
  it 'user story 2: displays the parent with id, with all its attributes' do
    artist = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
    visit "/artists/#{artist.id}"

    expect(page).to have_content(artist.alive)
    expect(page).to have_content(artist.name)
    expect(page).to have_content(artist.first_name)
    expect(page).to have_content(artist.age)
    expect(page).to have_content(artist.created_at)
  end

  it 'user story 7: displays a number of children associated with the artist' do
    artist1 = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: true)
    record1 = Record.create!(title: "Bob Dylan", genre: 'Folk', used: false, year: 1962, artist_id: artist1.id)
    record2 = Record.create!(title: "The Freewheelin'", genre: 'Folk', used: true, year: 1963, artist_id: artist1.id)
    record3 = Record.create!(title: "Another Side Of", genre: 'Folk', used: false, year: 1964, artist_id: artist1.id)

    visit "/artists/#{artist1.id}"
    expect(page).to have_content("3 records in file")
  end

  it "user story 10: has a link to see the artist's records" do
    artist1 = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: true)
    record1 = Record.create!(title: "Bob Dylan", genre: 'Folk', used: false, year: 1962, artist_id: artist1.id)
    record2 = Record.create!(title: "The Freewheelin'", genre: 'Folk', used: true, year: 1963, artist_id: artist1.id)
    record3 = Record.create!(title: "Another Side Of", genre: 'Folk', used: false, year: 1964, artist_id: artist1.id)

    visit "/artists/#{artist1.id}"
    expect(page).to have_content("Records by the artist")
    click_link ("Records by the artist")
    expect(current_path).to eq("/artists/#{artist1.id}/records")
    expect(page).to have_content("Another Side Of")
  end

  it 'user story 19: deletes artist shown along w/ all hikers associated linked to the mountain' do
    artist1 = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: true)
    artist2 = Artist.create!(name: 'Costello', first_name: 'Elvis', age: 76, alive: true)

    record1 = Record.create!(title: "Bob Dylan", genre: 'Folk', used: false, year: 1962, artist_id: artist1.id)
    record2 = Record.create!(title: "The Freewheelin'", genre: 'Folk', used: true, year: 1963, artist_id: artist1.id)
    record3 = Record.create!(title: "Another Side Of", genre: 'Folk', used: false, year: 1964, artist_id: artist1.id)
    record4 = Record.create!(title: "My Aim Is True", genre: 'Rock', used: true, year: 1977, artist_id: artist2.id)
    record5 = Record.create!(title: "This Year's Model", genre: 'Rock', used: false, year: 1978, artist_id: artist2.id)
    record6 = Record.create!(title: "Armed Forces", genre: 'Rock', used: true, year: 1979, artist_id: artist2.id)

    visit "/artists/#{artist1.id}"

    click_link('Delete Artist')

    expect(page).to_not have_content(artist1.first_name)
    expect(page).to_not have_content(artist1.name)
    expect(page).to_not have_content(artist1.age)


    visit "/records"

    expect(page).to_not have_content(record1.used)
    expect(page).to_not have_content(record1.title)

  end
end
