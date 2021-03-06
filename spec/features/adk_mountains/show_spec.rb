require 'rails_helper'

RSpec.describe 'the adk_mountain show page' do
  describe 'Iteration 1' do
    it 'US:2 displays the adk_mountain with id, with all its attributes' do
      adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
      visit "/adk_mountains/#{adk_mountain.id}"

      expect(page).to have_content(adk_mountain.id)
      expect(page).to have_content(adk_mountain.name)
      expect(page).to have_content(adk_mountain.elevation)
      expect(page).to have_content(adk_mountain.updated_at)
      expect(page).to have_content(adk_mountain.created_at)
      expect(page).to_not have_content(adk_mountain)
    end
    it 'US:7 displays the count of the number of hikers associated with the adk_mountain' do
      adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
      hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)
        visit "/adk_mountains/#{adk_mountain.id}"
        within('section') do
          expect(page).to have_content(1)
        end
    end
    it 'US:8 has a link to hiker index' do
      adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
      hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)

      visit "/adk_mountains/#{adk_mountain.id}"

      click_link('Hikers')

      expect(current_path).to eq("/hikers")
    end
    it 'US:9 has a link to adk_mountain index' do
      adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
      hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)

      visit "/adk_mountains/#{adk_mountain.id}"

      click_link('ADK Mountains')

      expect(current_path).to eq("/adk_mountains")
    end
    it "US:10 has a link to see the adk_mountains hikers" do
      adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
      hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)

      visit "/adk_mountains/#{adk_mountain.id}"
      expect(page).to have_content("ADK Mountain w/ ID")
      click_link ("Hikers associated with this mountain")
      expect(current_path).to eq("/adk_mountains/#{adk_mountain.id}/hikers")
      expect(page).to have_content("Hikers on")
    end


  end
  describe 'Iteration 3' do
    it 'US:19 can delete the mountain shown along w/ all hikers associated linked to the mountain' do
      adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)
      hiker = adk_mountain.hikers.create(name: 'Billy', phone_num: 585, on_mountain: true)

      visit "/adk_mountains/#{adk_mountain.id}"

      click_link('Delete Adk Mountain')

      expect(page).to_not have_content(adk_mountain.id)
      expect(page).to_not have_content(adk_mountain.name)
      expect(page).to_not have_content(adk_mountain.elevation)
      expect(page).to_not have_content(adk_mountain.updated_at)
      expect(page).to_not have_content(adk_mountain.created_at)

      visit "/hikers"

      expect(page).to_not have_content(hiker.id)
      expect(page).to_not have_content(hiker.name)

    end
  end
end
