class EquipmentController < ApplicationController
  def index
    @equipments = Equipment.all
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
