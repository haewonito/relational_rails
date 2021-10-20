require 'rails_helper'

RSpec.describe 'the adk_mountains index page' do
  it 'user story 1: displays the adk_mountain names' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    visit "/adk_mountains"

    expect(page).to have_content(adk_mountain.name)
    expect(page).to_not have_content(adk_mountain.elevation)
    expect(page).to_not have_content(adk_mountain.high_peak)
  end
  it 'US:6 can display adk_mountains in order of when it was created' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    adk_mountain1 = AdkMountain.create(name: 'Dix', elevation: 5344, high_peak: true)

    visit "/adk_mountains"

    within(first('section')) do
      expect(adk_mountain.name).to have_content('Marcy')
      expect(adk_mountain.name).to_not have_content('Dix')
    end
  end
  
  it 'US:23 can click link and delete any adk_mountain' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)

    visit "/adk_mountains"

    click_link('Delete')

    expect(page).to_not have_content(adk_mountain.id)
    expect(page).to_not have_content(adk_mountain.name)
    expect(page).to_not have_content(adk_mountain.elevation)
    expect(page).to_not have_content(adk_mountain.high_peak)
    expect(page).to_not have_content(adk_mountain.created_at)
  end
end
