class ThemesController < ApplicationController
	before_filter :authenticate_user!

	def new
		@theme = Theme.new
	end

	def create
		@theme = Theme.new(params[:theme].merge!(:user => current_user))
		if @theme.save
			flash[:notice] = "Theme was created sucessfully"
			redirect_to theme_path(@theme)
		else
			flash[:notice] = "There was an error while creating the theme"
			render :new
		end
	end

	def show
		@theme = Theme.find(params[:id])
	end

	def index
	end
end
