class TracksController < ApplicationController

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @track = Track.new

    render :new
  end

end
