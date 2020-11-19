class EquipmentController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @equipments = Equipment.all
    if params[:category].present?
      @equipments = @equipments.where(category: params[:category])
    end

    @markers = @equipments.geocoded.map do |equipment|
      {
        lat: equipment.latitude,
        lng: equipment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { equipment: equipment })
      }
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = current_user
    if @equipment.save!
      redirect_to @equipment, notice: "Equipment was succesfully created."
    else
      render :new
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

  def update
    @equipment = Equipment.find(params[:id])
    @equipment.update(equipment_params)
    if @equipment.save!
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy
    redirect_to equipment_index_path
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :description, :category, :price, :location, photos: [])
  end
end

