class PassagesController < ApplicationController
	before_filter :authenticate_user!
	def index
		@user=User.find(current_user.id)
		
		@passages=Passage.all
		@passage=Passage.new
	end
	def show
		@passage=Passage.find(params[:id])
		@passage.click!
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
		@passage.user_id=current_user.id
		
		  if @passage.save
                        @passages=Passage.all
                       
                        redirect_to passages_path
                else
                        @passages=Passage.all
                        
                        render :action => "index"
                end
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
		@passages=Passage.all
		render :action => "index"
		#redirect_to passages_path
		else
			redirect_to passages_path
		end
		
	end

end
