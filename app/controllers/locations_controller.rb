class LocationsController < ApplicationController
  #before show,edit,update,destroy get the location from the params
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end
  def new
    @location = Location.new
  end
  def create
    @location = Location.create(location_params)
    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @location.update(location_params)
      redirect_to locations_path
    else
      render :edit
    end
  end
  def destroy
    @location.destroy!
    redirect_to locations_path
  end

  private
  #method that grabs the id of the asset from the params and sets the right asset
  def set_location
    @location = Location.find_by(id: params[:id])
  end
  # method used to verify that only the correct parameters are being passed from the form
  def location_params
    params.require(:location).permit(:location_name, :location_address, :location_city, :location_state, :location_zip)
  end
end
