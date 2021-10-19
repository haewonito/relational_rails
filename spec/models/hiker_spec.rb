require 'rails_helper'

RSpect.describe Hiker, type: :model do
  it {should belong_to :adk_mountain}
end
