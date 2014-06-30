#encoding:utf-8
class CommentsController < ApplicationController
	def new
		#@passage=Passage.find(params[:para])
		@comment=Comment.new
		
	end
	def create
		@comment=Comment.new
		@comment.content=params[:comment][:content]
		@comment.passage_id=params[:comment][:passage_id]
		count=Passage.find(params[:comment][:passage_id]).comments.size
		if count
		@comment.flour_id=count+1
		else
		@comment.flour_id=1
		end
		@comment.author=current_user.username
		@comment.user_id=current_user.id		
		if @comment.save
			flash[:notice]="回帖成功"
			redirect_to passage_path(@comment.passage_id)
		else
			flash[:error]="回帖失败了呢，可能是您太短了"
			redirect_to passage_path(@comment.passage_id)
		end
	end
	def show
	end
	def edit
		@comment=Comment.find(params[:id])
		 if current_user.username!=@comment.author
			flash[:error]="哎呀不能编辑别人的东西啦"
			redirect_to passage_path(@comment.passage_id)
		end
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
