require 'rails_helper'
#US 13
RSpec.describe 'the hiker creation' do

  it 'links to the new page from the adk_mountain hikers index' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)

    visit "/adk_mountains/#{adk_mountain.id}/hikers"

    click_link('Create Hiker')
    expect(current_path).to eq("/adk_mountains/#{adk_mountain.id}/hikers/new")

  end

  it 'can create a new adk_mountain' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)

    visit "/adk_mountains/#{adk_mountain.id}/hikers/new"

    fill_in(:name, with: 'Addy')
    fill_in(:phone_num, with: 888)
    fill_in(:on_mountain, with: true)


    click_button('Create Hiker')

    expect(current_path).to eq("/adk_mountains/#{adk_mountain.id}/hikers")
    expect(page).to have_content('Addy')
  end

end
