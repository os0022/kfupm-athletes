class SearchController < ApplicationController

	def index
		@match = Match.where(nil)

	  filtering_params(params).each do |key, value|
    @match = @match.public_send(key, value) if value.present?
    end

   	respond_to do |format|
	    format.json {render json: @match}
	    format.html
  	end
	end



	private
	def filtering_params(params)
    params.slice(:category)
  end
end
