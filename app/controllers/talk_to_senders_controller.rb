class TalkToSendersController < ApplicationController
	
	def create
		@order = Order.find(params[:order_id])
		@sender = User.find(@order.sender_id)
		@questions_or_comments = params[:questions_or_comments_to_sender]
		@taker = User.find(current_user.id)
		UserMailer.comments(@sender, @questions_or_comments, @taker, @order).deliver_now
		# redirect_to home_path
	end

	def new
		
	end

	def update
		@taker = User.find(current_user.id)
		@order = Order.find(params[:id])
		@sender = User.find(@order.sender_id)
		@order.update({:taker_id => @taker.id})
		UserMailer.confirm_to_sender(@sender, @taker, @order).deliver_now
		redirect_to home_path
	end

end
