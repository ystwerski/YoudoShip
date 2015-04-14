class GeneralInfosController < ApplicationController

	def index
		if current_user
			@greeting = "Hello " + current_user.first_name + "!"
		elsif
			redirect_to "/users/sign_in"
			# @greeting = "Hello!"
		end
	end

	def show
		
	end 

end
