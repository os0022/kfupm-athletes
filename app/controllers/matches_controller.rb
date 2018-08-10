class MatchesController < ApplicationController

	def index
		@matches = Match.where(num_of_player: (1..(1/0.0)))
		@match = @matches.page(params[:page]).per(9)

		respond_to do |format|
      format.html
      format.js { render :layout => false }
    end

	end

	def create
		@match = Match.new(match_params)
		@match.user_id = current_user.id
		if @match.save
			redirect_to @match
		else
			flash[:danger] = "Some thing went wrong, you are not allowed to create a match."
			redirect_back fallback_location: @match
		end
	end
	
	def new
	end

	def show
		@match = Match.find(params[:id])
	end
	
	def edit
		@match = Match.find(params[:id])
	end
		
	def update
		@match = Match.find(params[:id])
		if @match.user_id != current_user.id
			flash[:danger] = "You're not the host of this match!"
			redirect_back fallback_location: @match
		else
			if @match.update(match_params)
				redirect_to @match
			else
				render 'edit'
			end

		end
	end



	private
	def match_params
		params.require(:match).permit(:category, :position, :field, :date, :start_time, :num_of_player)

	end	
end
