class HikersController < ApplicationController
  def index
    @hikers = Hiker.all
  end

  def show
    @hiker = Hiker.find(params[:id])
  end
  
  def edit
    @hiker = Hiker.find(params[:id])
  end
  def update
    @hiker = Hiker.find(params[:id])
    @hiker.update(name: params[:name], phone_num: params[:phone_num], on_mountain: params[:on_mountain])
    redirect_to "/hikers/#{@hiker.id}"
  end

  def destroy
    @hiker = Hiker.find(params[:id])
    Hiker.destroy(params[:id])
    redirect_to "/hikers"
  end
end
