class TakersController < ApplicationController
	
	def index
		address = params[:travelling_from_address] + " " + params[:travelling_from_city + ", " + params[:travelling_from_state]
		@list = Order.where(:shipping_from_address => address)
	end

	def new
		if !current_user
			redirect_to "/users/sign_in"
		end

	end

	def create 
		redirect_to takers_path
	end
end
