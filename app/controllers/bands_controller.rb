class BandsController < ApplicationController

  def new
    @band = Band.new
    render :new
  end

  def index
    @bands = Band.all
    render :index
  end

  def show
    if params.include?(:id)
      @band = Band.find(params[:id])
    else
      render :index
    end
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end


  private
  def band_params
    params.require(:band).permit(:name)
  end





end
