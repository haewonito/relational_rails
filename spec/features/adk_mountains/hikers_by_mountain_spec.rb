require 'rails_helper'

RSpec.describe 'the adk_mountains hikers index page' do
  it 'US:5 displays the hikers names' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)
    visit "/adk_mountains/#{adk_mountain.id}/hikers"

    expect(page).to have_content(hiker.name)
    expect(page).to have_content(hiker.phone_num)
    expect(page).to have_content(hiker.on_mountain)
  end
  it 'US:8 has a link to hiker index' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)

    visit "/adk_mountains/#{adk_mountain.id}/hikers"

    click_link('Hikers')

    expect(current_path).to eq("/hikers")
  end
  it 'US:9 has a link to adk_mountain index' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)

    visit "/adk_mountains/#{adk_mountain.id}/hikers"

    click_link('ADK Mountains')

    expect(current_path).to eq("/adk_mountains")
  end
  it 'US:16 can click link and sort hikers alphabetically' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)
    hiker1 = adk_mountain.hikers.create(name: 'Shelby', phone_num: 585, on_mountain: true)
    visit "/adk_mountains/#{adk_mountain.id}/hikers"

    within(first('section')) do
      expect(page).to have_content('Billy')
      expect(page).to_not have_content('Shelby')
    end
  end
  it 'US:18 can click link and edit hiker for each hiker on table' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)
    hiker1 = adk_mountain.hikers.create(name: 'Shelby', phone_num: 585, on_mountain: true)
    visit "/adk_mountains/#{adk_mountain.id}/hikers"

    first('section').click_link('Edit')

    expect(current_path).to eq("/hikers/#{hiker.id}/edit")
  end

end
