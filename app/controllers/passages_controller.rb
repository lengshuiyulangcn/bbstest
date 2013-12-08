class PassagesController < ApplicationController
	before_filter :authenticate_user!
	def index
		@passages=Passage.all
		@passage=Passage.new
	end
	def show
		@passage=Passage.find(params[:id])
		@comment=Comment.new
	end
	def new
		@passage=Passage.new
	end
	def create
		author=current_user.username
		@passage=Passage.new
		@passage.title=params[:passage][:title]
		@passage.content=params[:passage][:content]
		@passage.author=author
		@passage.save
		redirect_to passages_path
	end
	def edit
		@passage=Passage.find(params[:id])
	end
	def update
		@passage=Passage.find(params[:id])
		@passage.title=params[:passage][:title]
		@passage.content=params[:passage][:content]
		@passage.save
		redirect_to passage_path(params[:id])
	end
	def destroy
		@passage=Passage.find(params[:id])
		if current_user.username==@passage.author
		Passage.delete(@passage)
		redirect_to passages_path
		else
			redirect_to passages_path
		end
		
	end

end
