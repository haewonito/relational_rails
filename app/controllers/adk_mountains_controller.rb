class AdkMountainsController < ApplicationController

  def index
    @adk_mountains = AdkMountain.all.order(created_at: :asc)
  end

  def show
    @adk_mountain = AdkMountain.find(params[:id])
    @count = @adk_mountain.hikers.length
  end

  def hikers_by_mountain
    @adk_mountain = AdkMountain.find(params[:id])
    @hikers = @adk_mountain.hikers
    if params[:sort] == 'asc'

      @adk_mountain = AdkMountain.find(params[:id])
      @hikers = @adk_mountain.hikers.all.order(:name)
    end
  end

  def new
  end

  def create
    AdkMountain.create(name: params[:name], elevation: params[:elevation], high_peak: params[:high_peak])
    redirect_to '/adk_mountains'
  end

  def edit
    @adk_mountain = AdkMountain.find(params[:id])
  end

  def update
    @adk_mountain = AdkMountain.find(params[:id])
    @adk_mountain.update(name: params[:name], elevation: params[:elevation], high_peak: params[:high_peak])
    redirect_to "/adk_mountains/#{@adk_mountain.id}"
  end

  def new_hiker
    @adk_mountain = AdkMountain.find(params[:id])
  end

  def create_hiker
    @adk_mountain = AdkMountain.find(params[:id])
    @adk_mountain.hikers.create(name: params[:name], phone_num: params[:phone_num], on_mountain: params[:on_mountain])
    redirect_to "/adk_mountains/#{@adk_mountain.id}/hikers"
  end

  def destroy
    @adk_mountain = AdkMountain.find(params[:id])

    @adk_mountain.hikers.destroy_all
    AdkMountain.destroy(params[:id])
    redirect_to "/adk_mountains"
  end

end
