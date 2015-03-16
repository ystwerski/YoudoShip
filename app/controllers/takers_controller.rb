class TakersController < ApplicationController
	def new
		if !current_user
			redirect_to "/users/sign_in"
		end
		
	end
end
