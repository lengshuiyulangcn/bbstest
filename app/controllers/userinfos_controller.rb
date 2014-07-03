class UserinfosController < ApplicationController
	
	def update
		@userinfo=Userinfo.find(params.permit(:id)[:id])
		@userinfo.image=params[:userinfo][:image]
		@userinfo.pr=params[:userinfo][:pr]
		@userinfo.save
		redirect_to edit_userinfo_path(params[:id])
		#@userinfo=Userinfo.new
	end
	def edit
		@userinfo=Userinfo.find(params.permit(:id)[:id])
		@passages=Passage.where(:user_id=>@userinfo.user_id)
	end
end
