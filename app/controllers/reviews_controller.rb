class ReviewsController < ApplicationController
  def new
    @equipment = Equipment.find(params[:equipment_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @equipment = Equipment.find(params[:equipment_id])
    @review.equipment = @equipment
    if @review.save!
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to equipment_path(@review.equipment)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
