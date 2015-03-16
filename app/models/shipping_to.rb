class ShippingTo < ActiveRecord::Base
	has_many :orders
	geocoded_by :address
	after_validation :geocode
end
