class AdkMountainsController < ApplicationController
  def index
  end
  def names
    @adk_mountains = AdkMountain.all
  end
  def table
    @adk_mountain = AdkMountain.find(params[:id])
  end
  def hikers_by_mountain
    @adk_mountain = AdkMountain.find(params[:id])
    @hikers = Hiker.find(params[])

  end
end
