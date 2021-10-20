require 'rails_helper'

RSpec.describe 'as a visitor' do
  it 'see all the attributes belonging to that record' do
      #US5
    artist1 = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
    record1 = Record.create!(title: "My Aim Is True", genre: 'Rock', used: false, year: 1977, artist_id: artist1.id)
    record2 = Record.create!(title: "Bob Dylan", genre: 'Folk', used: false, year: 1962, artist_id: artist1.id)

    artist2 = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)
    record3 = Record.create!(title: "Almost Blue", genre: 'Folk', used: true, year: 1981, artist_id: artist2.id)


    visit "/artists/#{artist1.id}/records"

    expect(page).to have_content(record1.title)
    expect(page).to have_content(record1.genre)
    expect(page).to have_content(record1.used)
    expect(page).to have_content(record2.year)
    expect(page).to have_content(record2.artist_id)

    expect(page).to_not have_content(record3.title)
    expect(page).to_not have_content(record3.used)
    expect(page).to_not have_content(record3.year)
    expect(page).to_not have_content(record3.artist_id)
  end

#   User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)
#
# As a visitor
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order
# When I click on the link
# I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order

  xit "user story 16: sort artist's records in alphabetical order by title" do
    visit "artists/#{artist1.id}/records"

    click_link ("Sort Records in Alphabetical Order")

    expect(current_path).to eq("artists/#{artist1.id}/records")
    expect(page).to


  end
end
