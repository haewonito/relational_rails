require 'rails_helper'

RSpec.describe 'the hikers index page' do
  it 'US:1 displays the hikers names' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)

    visit "/hikers"

    expect(page).to have_content(hiker.id)
    expect(page).to have_content(hiker.name)
    expect(page).to have_content(hiker.phone_num)
    expect(page).to have_content(hiker.on_mountain)
    expect(page).to have_content(hiker.created_at)
    expect(page).to_not have_content(adk_mountain)
  end
end
