class UserMailer < ApplicationMailer

	def comments(user, questions_or_comments)
    	@user = user
    	@questions_or_comments = questions_or_comments
    	@url  = 'http://example.com/login'
    	mail(to: @user.email, subject: 'Welcome to My Awesome Site')
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

