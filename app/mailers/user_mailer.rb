class UserMailer < ApplicationMailer
	
	def comments(sender, questions_or_comments, taker, order)
    	@sender = sender
    	@taker = taker
    	@order = order
    	@questions_or_comments = questions_or_comments
    	@url  = 'http://example.com/login'
    	mail(reply_to: @taker.email, to: @sender.email, subject: "package going to #{@order.shipping_to.address}")
  	end

  	def confirm_to_sender(sender, taker, order)
  		@sender = sender
  		@taker = taker
  		@order = order
  		mail(to: @sender.email, subject: 'You have a shipper for your package!!!')
  	end

  	def confirm_to_taker()

  	end

end

