require 'rails_helper'

RSpec.describe 'the artists show page' do
    it 'displays the artist names' do
      visit "/artists"
    end

end
