class SessionsController < ApplicationController

	def new
	end

	def create

		user = User.find_by(username: params[:session][:username])

		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			puts "Session ID:"
			puts session[:user_id]
			redirect_to user_path(user)
		else
			render 'new'
		end

	end


	def destroy
		session[:user_id] = nil
	    flash[:success] = "You have logged out"
	    redirect_to root_path
	end

end