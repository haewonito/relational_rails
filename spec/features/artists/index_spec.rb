require 'rails_helper'

#US1
RSpec.describe 'the artists show page' do
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
#   User Story 6, Parent Index sorted by Most Recently Created (x2)
#
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

  end
end
