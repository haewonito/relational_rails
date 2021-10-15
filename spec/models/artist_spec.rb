require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}
  #do it with has_many commented out to prevent false positive
end
