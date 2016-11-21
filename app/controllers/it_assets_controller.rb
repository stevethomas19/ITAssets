class ItAssetsController < ApplicationController
  #before show,edit,update,destroy get the it_asset from the params
  before_action :set_it_asset, only: [:show, :edit, :update, :destroy]

  def index
    @it_assets = ItAsset.all
  end
  def new
    @it_asset = ItAsset.new
  end
  def create
    @it_asset = ItAsset.create(it_asset_params)
    if @it_asset.save
      redirect_to it_assets_path
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @it_asset.update(it_asset_params)
      redirect_to it_assets_path
    else
      render :edit
    end
  end
  def destroy
    @it_asset.destroy!
    redirect_to it_assets_path
  end

  private
  #method that grabs the id of the asset from the params and sets the right asset
  def set_it_asset
    @it_asset = ItAsset.find_by(id: params[:id])
  end
  # method used to verify that only the correct parameters are being passed from the form
  def it_asset_params
    params.require(:it_asset).permit(:asset_name, :description, :month_implemented, :year_implemented,
                                      :maintenance_notes, :location_id, :manufacturer_part_number, :manufacturer_id)
  end
end
