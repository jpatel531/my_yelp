class RestaurantsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def index
		@restaurants = Restaurant.all
		@review = Review.new
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		Restaurant.create(restaurant_params)
		redirect_to '/restaurants'
	end

	def edit
		@restaurant = Restaurant.find params[:id]
	end

	def update
		@restaurant = Restaurant.find params[:id]
		@restaurant.update restaurant_params
		redirect_to '/restaurants'
	end

	def destroy
		@restaurant = Restaurant.find params[:id]
		@restaurant.destroy
		flash[:notice] = "Successfully deleted #{@restaurant.name}"
		redirect_to '/restaurants'
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :cuisine)
	end

end
