class EquipmentController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @equipments = Equipment.all
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
  end

  def update
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :description, :price)
  end
end
