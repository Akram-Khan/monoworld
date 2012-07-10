class CommentsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_photo

	def create
		@comment = @photo.comments.build(params[:comment])
		@comment.save
		redirect_to [@photo.theme,@photo]
	end

	def destroy
	end

	private

	def find_photo
		@photo = Photo.find(params[:photo_id])
	end
end
