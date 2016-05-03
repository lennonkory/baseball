class UsersController < ApplicationController

	before_action :set_user, only: [:edit, :update, :show]
 	before_action :require_same_user, only:[:edit, :update, :show]

	def index
	end

	def new
		@user = User.new
	end

	def create

		@user = User.new(user_params)
		
		if @user.save
			redirect_to user_path(@user)
		else
			render 'new'
		end

	end

	def show
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end

	def set_user
	    @user = User.find(params[:id])
	  end

  def require_same_user

  	if current_user.nil?
  		flash[:danger] = "You can not edit this profile"
  		redirect_to root_path

    elsif current_user != @user
      flash[:danger] = "You can not edit this profile"
      redirect_to user_path(current_user)
    end
  end

end