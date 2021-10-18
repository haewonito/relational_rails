class HikersController < ApplicationController
  def index
    @hikers = Hiker.all
  end
  def table
    @hikers = Hiker.all
  end
  def by_id
    @hiker = Hiker.find(params[:id])
  end

  def hikers_by_mountain
    @hikers = Hiker.find(params[:adk_mountain_id])
  end

end
