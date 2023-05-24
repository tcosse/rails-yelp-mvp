class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(params_review)
    @review.restaurant = @restaurant
    @review.save
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
