class GeneralInfosController < ApplicationController

	def index
		if current_user
			@greeting = "Hello" + current_user.first_name + "!"
		elsif
			@greeting = "Hello!"
		end
	end 

end
