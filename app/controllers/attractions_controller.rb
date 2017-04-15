class AttractionsController < ApplicationController

	def index
		@attractions = Attraction.all
		@user = User.find(session[:user_id])
	end

	def show
		@attraction = Attraction.find(params[:id])
		@user = User.find(session[:user_id])
		# binding.pry
		@ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
		flash[:message] = @ride.take_ride
		@ride.save

	end

	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.new(attraction_params)
		if @attraction.save
			redirect_to ride_path(@attraction)
		else
			redirect_to create_ride_path
		end
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end

	def update
		@attraction = Attraction.find(params[:id])
		if @attraction.update(attraction_params)
			redirect_to ride_path(@attraction)
		else
			redirect_to edit_ride_path
		end
	end

private

	def attraction_params
		params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
	end


end
