class AdkMountainsController < ApplicationController
  def index
  end
  def names
    @adk_mountains = AdkMountain.all.order(created_at: :desc)
  end
  def table
    @adk_mountain = AdkMountain.find(params[:id])
    @count = @adk_mountain.hikers.length
  end
  def hikers_by_mountain
    @adk_mountain = AdkMountain.find(params[:id])
    @hikers = @adk_mountain.hikers

  end
end
