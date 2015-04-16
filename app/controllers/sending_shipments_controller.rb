class SendingShipmentsController < ApplicationController
	

	def new
	end

	def create

		# EasyPost.api_key = 'gY8ZokYkvssGDwvRes5s4A'
		@shipping_from = ShippingFrom.create({:address => params[:shipping_from] + " " + params[:shipping_from_city] + ", " + params[:shipping_from_state]})
		shipping_from_zip_code = Geokit::Geocoders::GoogleGeocoder.geocode(@shipping_from.address)
		@shipping_to = ShippingTo.create({:address => params[:shipping_to_address] + " " + params[:shipping_to_city] + ", " + params[:shipping_to_state]})
		shipping_to_zip_code = Geokit::Geocoders::GoogleGeocoder.geocode(@shipping_to.address)
		

# packages = ActiveMerchant::Shipping::Package.new(params[:package_weight].to_i * 16,             # 7.5 lbs, times 16 oz/lb.
#                                [params[:package_width].to_i, params[:package_length].to_i, params[:package_height].to_i],        # 15x10x4.5 inches
#                                :units => :imperial)  # not grams, not centimetres

# # You live in Beverly Hills, he lives in Ottawa
# origin = ActiveMerchant::Shipping::Location.new( :country => 'US',
#                                        :state => params[:shipping_from_state],
#                                        :city => params[:shipping_from_city],
#                                        :zip => (shipping_from_zip_code))

# destination = ActiveMerchant::Shipping::Location.new( :country => 'US',
#                                             :state => params[:shipping_to_state],
#                                             :city => params[:shipping_to_city],
#                                             :postal_code => (shipping_to_zip_code))
		# p packages
		# p origin
		# p destination
		# date = params[:date]
		# date = date.split('/')
		# date = date.join
		# time = params[:time]
		# time = time.split(':')
		# time = time.join
		


		@order = Order.new({:confirmed => false, :packages => params[:packages], :shipping_from_id => @shipping_from.id, :shipping_to_id => @shipping_to.id, :subtotal => params[:price].to_i, :tax => params[:price].to_i * 0.05, :total => params[:price].to_i - (params[:price].to_i * 0.05)})
		
		if current_user
			@order.update({:sender_id => current_user.id})
		end
		
		@order.save
		@address_from = params[:shipping_from]
		@city_from = params[:shipping_from_city]
		@state_from = params[:shipping_from_state]
		@address_to = params[:shipping_to_address]
		@city_to = params[:shipping_to_city]
		@state_to = params[:shipping_to_state]
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
			redirect_to view_sending_packages_path
		else 
			redirect_to new_user_session_path
		end
			
	end

end
