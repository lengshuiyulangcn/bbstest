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
		@comment.user_id=current_user.id		
		if @comment.save
			@passage=Passage.find(@comment.passage_id)
			redirect_to passage_path(@comment.passage_id)
		else
			@passage=Passage.find(params[:comment][:passage_id])
			render  :template =>"passages/show"
		end
	end
	def show
	end
	def edit
		@comment=Comment.find(params[:id])
	end
	def update
		@comment=Comment.find(params[:id])
		@comment.content=params[:comment][:content]
		@comment.save
		redirect_to passage_path(@comment.passage_id)
	end
	def destroy
		@comment=Comment.find(params[:id])
		passage_id=@comment.passage_id
		Comment.delete(@comment)
		redirect_to passage_path(passage_id)
	end
end
