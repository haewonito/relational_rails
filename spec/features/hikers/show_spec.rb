require 'rails_helper'

RSpec.describe 'the hikers show page' do
  describe 'Iteration 1' do
    it 'US:4 displays the hiker with id, with all its attributes' do
      adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
      hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)
      visit "/hikers/#{hiker.id}"

      expect(page).to have_content(hiker.id)
      expect(page).to have_content(hiker.name)
      expect(page).to have_content(hiker.phone_num)
      expect(page).to have_content(hiker.on_mountain)
      expect(page).to have_content(hiker.created_at)
      expect(page).to_not have_content(adk_mountain)
    end
  end
  describe 'Iteration 3' do
    it 'US:20 can delete the hiker shown ' do
      adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
      hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)

      visit "/hikers/#{hiker.id}"

      click_link('Delete Hiker')

      expect(page).to_not have_content(hiker.id)
      expect(page).to_not have_content(hiker.name)
      expect(page).to_not have_content(hiker.phone_num)
      expect(page).to_not have_content(hiker.on_mountain)
      expect(page).to_not have_content(hiker.created_at)
      expect(page).to have_content("Hikers")
    end


  end
end
