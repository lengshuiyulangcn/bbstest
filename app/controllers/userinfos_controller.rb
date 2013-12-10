class UserinfosController < ApplicationController
	
	def update
		@userinfo=Userinfo.find(params[:id])
		@userinfo.image=params[:userinfo][:image]
		@userinfo.save
		redirect_to edit_userinfo_path(params[:id])
		#@userinfo=Userinfo.new
	end
	def edit
		@userinfo=Userinfo.find(params[:id])
	end
end
