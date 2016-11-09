class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [:new, :create]

  def new

    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.build(review_params)

    # @review = Review.new(review_params)
    # @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
