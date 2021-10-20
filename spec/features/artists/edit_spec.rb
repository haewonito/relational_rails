# need to fix!!!  Haven't ran it
# US18
require 'rails_helper'

RSpec.describe 'this artist edit' do

  it 'links to the edit page' do
    artist = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)

    visit '/artists'

    click_button "Edit #{artist.name}"

    expect(current_path).to eq("/artists/#{artist.id}/edit")
  end

  it 'can edit the artist' do
    artist = Artist.create!(name: 'McDowell', first_name: 'Fred', age: 66, alive: false)

    visit "/artists/#{artist.id}/edit"

    expect(page).to have_content('McDowell')

    fill_in 'artist[name]', with: 'Prince'
    click_button 'Update Artist'

    expect(current_path). to eq('/artists')
    expect(page).to have_content('Prince')
  end
end
