require 'rails_helper'

RSpect.describe Record, type: :model do
  it {should belong_to :artist}
end
