class ViewSendingPackagesController < ApplicationController

	def index
		@user = current_user
		# @orders = Order.where("sender_id= ? or taker_id= ?", @user.id, @user.id)
		@orders = Order.where(sender_id: @user.id)
	end

	def show
		@order = Order.find(params[:id])
	end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to view_sending_packages_path
	end

end
