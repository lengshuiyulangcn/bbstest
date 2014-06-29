#encoding:utf-8
class PassagesController < ApplicationController
	before_filter :authenticate_user!
	def index
		@user=User.find(current_user.id)
		@passages= Passage.paginate(:page => params[:page], :order=>'created_at DESC', :per_page => 10)	
		#@num=@passages.size/10
		#pagenow=params[:page].to_i-1
		#puts pagenow
		#if pagenow!=nil
	#		@passages=@passages[pagenow*10..pagenow*10+9]
	#	else
	#		@passages=@passages[0..10]
	#	end
		@passage=Passage.new
	end
	def show
		@passage=Passage.find(params[:id])
		@passage.click!
		@comments=Comment.where(passage_id: params[:id]).paginate(:page => params[:page], :order=>'created_at DESC', :per_page => 5)	
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
		@passage.category_id=params[:passage][:id]
		@passage.author=author
		@passage.user_id=current_user.id
		
		  if @passage.save
                        # @passages=Passage.all
                  
                        redirect_to category_path(params[:passage][:id]), :notice=>"new passage created"
                else
                        redirect_to category_path(params[:passage][:id]), :error=>"your input not correct"
                end
	end
	def edit
		@passage=Passage.find(params[:id])
		if current_user!=@passage.user
			flash[:notice]="not permitted"
			redirect_to passages_path
		end
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
		if current_user==@passage.user
		Passage.delete(@passage)
		# @passages=Passage.all
		redirect_to edit_userinfo_path(current_user.userinfo.id)
		else
			flash[:notice]="not permitted"
			redirect_to passages_path
		end
		
	end

end
