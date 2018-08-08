class BookingsController < ApplicationController

	def index
		@booking = Booking.where(user_id:current_user.id)
	end	

	def new
		@Match = Match.find(params[:match_id])
	end

	def create
		@match = Match.find(params[:match_id])
		@booking = Booking.new
		@booking.user_id = current_user.id
		@booking.match_id = params[:match_id]
		if @booking.save
			@match.num_of_player = @match.num_of_player - 1
			@match.save
			flash[:success] = "You've sucessfully joined this match, see you on the field :)"
			redirect_to @match
		else 
			flash[:danger] = "You can't join this match"
			redirect_back fallback_location: @match
		end
	end

	def show
		@match = Match.find(params[:match_id])
		@booking = Booking.find(params[:id])
	end

end
