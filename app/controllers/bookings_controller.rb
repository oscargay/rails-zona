class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    # /equipments/:equipment_id/bookings/new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @equipment = Equipment.find(params[:equipment_id])
    @booking.equipment = @equipment
    @booking.user = current_user
    if @booking.save!
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  def update
  end
end
