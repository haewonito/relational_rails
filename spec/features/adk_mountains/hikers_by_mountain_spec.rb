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
end
