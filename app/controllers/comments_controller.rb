class CommentsController < ApplicationController
	def new
		#@passage=Passage.find(params[:para])
		@comment=Comment.new
		
	end
	def create
		@comment=Comment.new
		@comment.content=params[:comment][:content]
		@comment.passage_id=params[:comment][:passage_id]
		@comment.author=current_user.username
		@comment.save
		redirect_to passage_path(@comment.passage_id)
	end
	def destroy
	end
end
