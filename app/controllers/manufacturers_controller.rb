class ManufacturersController < ApplicationController
  #before show,edit,update,destroy get the manufacturer from the params
  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]

  def index
    @manufacturers = Manufacturer.all
  end
  def new
    @manufacturer = Manufacturer.new
  end
  def create
    @manufacturer = Manufacturer.create(manufacturer_params)
    if @manufacturer.save
      redirect_to manufacturers_path
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @manufacturer.update(manufacturer_params)
      redirect_to manufacturers_path
    else
      render :edit
    end
  end
  def destroy
    @manufacturer.destroy!
    redirect_to manufacturers_path
  end

  private
  #method that grabs the id of the asset from the params and sets the right asset
  def set_manufacturer
    @manufacturer = Manufacturer.find_by(id: params[:id])
  end
  # method used to verify that only the correct parameters are being passed from the form
  def manufacturer_params
    params.require(:manufacturer).permit(:manufacturer_name)
  end
end
