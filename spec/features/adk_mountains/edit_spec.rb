require 'rails_helper'


RSpec.describe 'this adk mountain edit' do

  describe "user story 12" do
    it 'can edit adk_mountains' do
      adk_mountain = AdkMountain.create(name: 'Marcy', elevation: 5344, high_peak: true)

      visit "/adk_mountains/#{adk_mountain.id}"
      click_link "Update Adk Mountain"

      expect(current_path).to eq("/adk_mountains/#{adk_mountain.id}/edit")

      fill_in :name, with: 'Colvin'
      click_button 'Update Adk Mountain'

      expect(current_path).to eq("/adk_mountains/#{adk_mountain.id}")
      expect(page).to have_content('Colvin')

    end
  end
end
