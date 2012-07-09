class PhotosController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_theme

	def new
		@photo = @theme.photos.build
	end

	def create
		@photo = @theme.photos.build(params[:photo])
		if @photo.save
			flash[:sucess] = "Sucessfully uploaded photo"
			redirect_to theme_path(@theme)
		else
			flash[:error] = "Could not upload photo"
			render :new
		end
	end

	def show
	end

	def destroy
	end

private

	def find_theme
		@theme = Theme.find(params[:theme_id])
	end
end
