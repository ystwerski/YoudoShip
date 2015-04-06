class TakersController < ApplicationController


	
	def index
		orders = []

		@counter = 1

		user_address_from = params[:travelling_from_address] + " " + params[:travelling_from_city] + ", " + params[:travelling_from_state]
		user_address_to = params[:travelling_to_address] + " " + params[:travelling_to_city] + ", " + params[:travelling_to_state]

		@user_address_from = Geocoder.coordinates(user_address_from)
		@user_address_to = Geocoder.coordinates(user_address_to)

		list_from = ShippingFrom.near(@user_address_from, 10)
		list_to = ShippingTo.near(@user_address_to, 10)

		orders_non_objects_from = []
		orders_non_objects_to = []

		list_from.each do |list_object|
			orders_non_objects_from << list_object.orders
		end
		list_to.each do |list_object|
			orders_non_objects_to << list_object.orders
		end
		orders_objects_from = []
		orders_objects_to =[]

		orders_non_objects_from.each do |order|
			orders_objects_from << order[0]
		end
		# p orders_objects_from
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
		p orders.count
		@orders = []
		orders.each do |order|
			p order
			if order.confirmed
				@orders << order
			end
		end
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
		order = Order.find(params[:id])
		@stuff = [order.id, order.sender_id, order.taker_id, order.shipping_from_id, order.shipping_to_id]
		p @stuff
	end
end
