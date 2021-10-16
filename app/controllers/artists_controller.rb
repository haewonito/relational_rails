class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def records
    @artist1 = Artist.find(params[:id])
    @records_for_artist = @artist1.records
  end

end
