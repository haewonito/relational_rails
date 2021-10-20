require 'rails_helper'
#US 11
RSpec.describe 'the adk mountain creation' do

  it 'links to the new page from the adk_mountains index' do

    visit '/adk_mountains'

    click_link('Create New Adk Mountain')
    expect(current_path).to eq('/adk_mountains/new')

  end

  it 'can create a new adk_mountain' do

    visit '/adk_mountains/new'

    fill_in(:name, with: 'Dix')
    fill_in(:elevation, with: '4800')
    fill_in(:high_peak, with: true)


    click_button('Create Adk Mountain')

    expect(current_path).to eq('/adk_mountains')
    expect(page).to have_content('Dix')
  end

end
