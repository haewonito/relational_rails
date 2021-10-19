require 'rails_helper'

RSpec.describe 'the adk_mountain show page' do

  it 'user story 2: displays the adk_mountain with id, with all its attributes' do
    adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
    visit "/adk_mountains/#{adk_mountain.id}"

    expect(page).to have_content(adk_mountain.id)
    expect(page).to have_content(adk_mountain.name)
    expect(page).to have_content(adk_mountain.elevation)
    expect(page).to have_content(adk_mountain.updated_at)
    expect(page).to have_content(adk_mountain.created_at)
    expect(page).to_not have_content(hiker.id)
  end
end
