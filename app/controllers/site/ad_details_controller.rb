class Site::AdDetailsController < ApplicationController

	def show
		@ad = Ad.find(params[:id])
	end

end
