class UsersController < ApplicationController

	def new

	end

	def create
	  user = User.new(user_params)
	  if user.save
	    session[:user_id] = user.id
	    redirect_to '/'
	  else
	    redirect_to '/users/new'
	  end
	end

	def show
		@user = User.find(params[:id])
		@match = Match.where(user_id: current_user.id )
		@booking = Booking.where(user_id: @user)
	end

	private
	def user_params
	  params.require(:user).permit(:email, :password)
	end



end



