class AdkMountainsController < ApplicationController
  def index
  end
  def names
    @adk_mountains = AdkMountain.all
  end
  def table
    @adk_mountain = AdkMountain.find(params[:id])
  end
end
