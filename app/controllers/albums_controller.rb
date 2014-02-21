class AlbumsController < ApplicationController


  def show
    @album = Album.find(params[:id])
    render :show
  end


  def create
    @album = Band.new(band_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end


  private
  def band_params
    params.require(:album).permit(:name, :band_id)
  end


end
