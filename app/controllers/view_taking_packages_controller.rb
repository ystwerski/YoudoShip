class ViewTakingPackagesController < ApplicationController

	def index
		@user = current_user

		@orders = Order.where(takers_id: @user.id)
	end


	def destroy

	end
	

end
