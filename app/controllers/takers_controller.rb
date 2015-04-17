class TakersController < ApplicationController


	
	def index
		orders = []

		@counter = 1

		user_address_from = params[:travelling_from_address] + " " + params[:travelling_from_city] + ", " + params[:travelling_from_state]
		user_address_to = params[:travelling_to_address] + " " + params[:travelling_to_city] + ", " + params[:travelling_to_state]
		p user_address_from
		@user_address_from = Geocoder.coordinates(user_address_from)
		@user_address_to = Geocoder.coordinates(user_address_to)
		p @user_address_from

		list_from = ShippingFrom.near(@user_address_from, params[:miles_from_place_of_origin_to_shipping_from_address].to_i)
		list_to = ShippingTo.near(@user_address_to, params[:miles_from_takers_destination_to_shipping_to_address].to_i)

		orders_non_objects_from = []
		orders_non_objects_to = []

		list_from.each do |list_object|
			orders_non_objects_from << list_object.orders
		end
		list_to.each do |list_object|
			p list_object
			orders_non_objects_to << list_object.orders
		end
		orders_objects_from = []
		orders_objects_to =[]

		orders_non_objects_from.each do |order|
			orders_objects_from << order[0]
		end
		p orders_objects_from.count
		orders_non_objects_to.each do |order|
			orders_objects_to << order[0]
		end
		# p orders_objects_to

		orders_objects_from.each do |order_object_from|
			orders_objects_to.each do |order_object_to|
				if order_object_from == order_object_to
					orders << order_object_to
				end
			end
		end
		@orders = []
		orders.each do |order|
			p order.class
			if order
				p order.class
				@orders << order
			end
		end
		# p orders
		p orders.count
		p @orders.count

	end

	def new
		if !current_user
			redirect_to "/users/sign_in"
		end

	end

	def create 
		redirect_to takers_path
	end

	def show
		@order = Order.find(params[:id])
		@user = User.find(@order.sender_id)
		# @stuff = [order.id, order.sender_id, order.taker_id, order.shipping_from_id, order.shipping_to_id]
	end
end
