class ShippingFrom < ActiveRecord::Base
	has_many :orders
	geocoded_by :address
	after_validation :geocode

	def self.get_zip(lat, long)
		require 'area'
		[lat, long].to_zip
	end
end
