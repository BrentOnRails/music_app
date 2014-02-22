class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end


  def create
    @album = Album.new(album_params)
    @album.band_id = params[:band_id]
    if @album.save
      redirect_to band_album_url(@album.band, @album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end


  private
  def album_params
    params.require(:album).permit(:name)
  end


end
