class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find_by(params[:id])
  end

  def new
  end

  def create
  end

  def update
  end
end
