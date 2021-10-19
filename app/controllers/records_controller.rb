class RecordsController < ApplicationController

  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    record = Record.find(params[:id])
      record.update({
                  genre: params[:record][:genre],
                  year: params[:record][:year],
                  used: params[:record][:used],
                  artist_id: params[:record][:artist_id],
                 })
    record.save
    redirect_to "/records/#{record.id}"
  end

end
