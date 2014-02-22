class TracksController < ApplicationController

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @track = Track.new

    render :new
  end

  def create
    @track = Track.new(track_params)
    @album = Album.find(params[:album_id])
    @track.album_id = @album.id
    if @track.save
      redirect_to band_album_url(@album.band, @album, @track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @album = @track.album
    if @track.destroy
      redirect_to band_album_url(@album.band, @album)
    end
  end

  private
  def track_params
    params.require(:track).permit(:name)
  end


end
