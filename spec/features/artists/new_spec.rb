require 'rails_helper'
#US 11
RSpec.describe 'the Artist creation' do

  it 'links to the new page from the artists index' do

    visit '/artists'

    click_link('New Artist')
    expect(current_path).to eq('/artists/new')

  end

  it 'can create a new artist' do

    visit '/artists/new'

    fill_in('artist[name]', with: 'Prince')
    fill_in('artist[first_name]', with: 'Whatever')
    fill_in('artist[age]', with: 50)
    fill_in('artist[alive]', with: false)

    click_button('Create Artist')
    new_artist_id = Artist.last.id
    expect(current_path).to eq('/artists')
    expect(page).to have_content('Prince')
  end

end
