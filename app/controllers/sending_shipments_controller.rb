class SendingShipmentsController < ApplicationController
	
	def new
	end

	def create
		# date = params[:date]
		# date = date.split('/')
		# date = date.join
		# time = params[:time]
		# time = time.split(':')
		# time = time.join
		@order = Order.new({:shipping_from_address => params[:shipping_from], :shipping_to_address => params[:shipping_to], :shipping_from_city => params[:shipping_from_city], :shipping_from_state => params[:shipping_from_state], :shipping_to_address => params[:shipping_to_address], :shipping_to_city => params[:shipping_to_city], :shipping_to_state => params[:shipping_to_state], :confirmed => false, :packages => params[:packages]})
		if current_user
			@order.update({:sender_id => current_user.id})
		end
		@order.save
		@address_from = @order.shipping_from_address
		@city_from = @order.shipping_from_city
		@state_from = @order.shipping_from_state
		@address_to = @order.shipping_to_address
		@city_to = @order.shipping_to_city
		@state_to = @order.shipping_to_state
      # t.integer :taker_id
      # t.text :notes
      # t.decimal :miles, precision: 6, scale: 1
      # t.decimal :kilometer, precision: 6, scale: 1
      # t.datetime :pickup_date
      # t.datetime :dropoff_date
      # t.integer :packages
      # t.decimal :subtotal, precision: 7, scale: 2
      # t.decimal :tax, precision: 6, scale: 2
      # t.decimal :total, precision: 7, scale: 2
		# @package_height = params[:package_height]
		# @package_length = params[:package_length]
		# @package_width = params[:package_width]
		# @package_weight = params[:package_weight]
	end

	def update
		if current_user
			@order = Order.find(params[:id])
			@order.update({:confirmed => true})
			if !@order.sender_id
				@order.update({:sender_id => current_user.id})
			end
		elsif 
			redirect_to new_user_session_path
		end
			
	end

end
