class TakersController < ApplicationController

	
	def index
		@address_from = params[:travelling_from_address] + " " + params[:travelling_from_city] + ", " + params[:travelling_from_state]
		@address_from = Geocoder.coordinates(address_from)
		list = ShippingFrom.near(@address_from, 10)
		orders = []
		list.each do |list_object|
			orders << list_object.orders
		end
		@orders =[]
		orders.each do |order|
			@orders << order[0]
		end

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
