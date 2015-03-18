class Order < ActiveRecord::Base
	belongs_to :shipping_from
	belongs_to :shipping_to
end
