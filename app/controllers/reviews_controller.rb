class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find params[:restaurant_id]
		@review = Review.new
	end

	def create
		@restaurant = Restaurant.find params[:restaurant_id]
		@review = @restaurant.reviews.create review_params
		flash[:notice] = "Review created"
		redirect_to '/restaurants' unless request.xhr?
	end

	private

	def review_params
		params.require(:review).permit(:thoughts, :rating)
	end


end
