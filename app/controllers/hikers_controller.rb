class HikersController < ApplicationController
  def index
    @hikers = Hiker.all
  end
  def table
    @hikers = Hiker.all
  end
end
