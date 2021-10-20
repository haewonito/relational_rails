class ArtistsController < ApplicationController

  def index
    @artists = Artist.all.order(created_at: :asc)
  end

  def show
    @artist = Artist.find(params[:id])
    @count = @artist.records.length
  end

  def records
    @artist1 = Artist.find(params[:id])
    @records_for_artist = @artist1.records
    if params[:sort] == 'asc'

      @artist1 = Artist.find(params[:id])
      @records_for_artist = @artist1.records.all.order(:title)
    end

  end

  def new
  end

#do I need .to_i and .to_b?
  def create
    artist = Artist.new({
      name: params[:artist][:name],
      first_name: params[:artist][:first_name],
      age: params[:artist][:age],
      alive: params[:artist][:alive]
      })

      artist.save
      redirect_to '/artists'
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
        artist.update({
          name: params[:artist][:name],
          first_name: params[:artist][:first_name],
          age: params[:artist][:age],
          alive: params[:artist][:alive]
          })
    artist.save
    redirect_to "/artists/#{artist.id}"
  end

  def new_record
    @artist = Artist.find(params[:id])
  end

  def create_record
    @artist = Artist.find(params[:id])
    @artist.records.create(genre: params[:genre], year: params[:year], used: params[:used], title: params[:title])
    redirect_to "/artists/#{@artist.id}/records"
  end

  def destroy
    @artist = Artist.find(params[:id])

    @artist.records.destroy_all
    Artist.destroy(params[:id])
    redirect_to "/artists"
  end


end
