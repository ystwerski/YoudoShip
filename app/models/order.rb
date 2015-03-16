class Order < ActiveRecord::Base
	geocoded_by :address_shipping_from, :latitude  => :from_latitude, :longitude => :from_longitude
	geocoded_by :address_shipping_to, :latitude  => :to_latitude, :longitude => :to_longitude
	# geocoded_by :address_shipping_from
	# geocoded_by :address_shipping_to
	after_validation :geocode

	def address_shipping_from
		[shipping_from_address, shipping_from_city, shipping_from_state].compact.join(', ')
	end

	def address_shipping_to
		[shipping_to_address, shipping_to_city, shipping_to_state].compact.join(', ')
	end
end
