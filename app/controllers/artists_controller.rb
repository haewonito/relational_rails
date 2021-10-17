class ArtistsController < ApplicationController

  def index
    @artists = Artist.all.order(created_at: :desc)
  end

  def show
    @artist = Artist.find(params[:id])
    @count = @artist.records.length
  end

  def records
    @artist1 = Artist.find(params[:id])
    @records_for_artist = @artist1.records
  end

end
