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
		@passage=Passage.find(params.permit(:id)[:id])
		@passage.click!
		@comments=Comment.where(passage_id: params.permit(:id)[:id]).paginate(:page => params[:page], :per_page => 5).order("created_at DESC")	
		@comment=Comment.new
	end
	def new
		@passage=Passage.new
	end
	def create
		author=current_user.username
		fake_params=passage_params
		@passage=Passage.new
		@passage.title=fake_params[:title]
		@passage.content=fake_params[:content]
		@passage.category_id=fake_params[:id]
		@passage.author=author
		@passage.user_id=current_user.id
		
		  if @passage.save
                        # @passages=Passage.all
                  
			flash[:notice]= "创建成功"
                        redirect_to category_path(params[:passage][:id])
                else
			flash[:error]= "创建失败了，你的帖子短于6cm呢"
                        redirect_to category_path(params[:passage][:id])
                end
	end
	def edit
		@passage=Passage.find(params.permit(:id)[:id])
		unless @passage.admin_list.include?(current_user)
			flash[:error]= "不是你的帖子不能乱编辑啦，知道你为什么没妹子么"
			redirect_to passage_path(params.permit(:id)[:id])
		end
	end
	def update
		fake_params=passage_params
		@passage=Passage.find(params.permit(:id)[:id])
		@passage.title=fake_params[:title]
		@passage.content=fake_params[:content]
		@passage.content+="<div class='footer'>最后由#{current_user.username}于#{format_time(Time.now)}进行编辑</div>"
		@passage.save
		redirect_to passage_path(params.permit(:id)[:id])
	end
	def destroy
		fake_params=params.permit(:id)
		@passage=Passage.find(fake_params[:id])
		if @passage.admin_list.include?(current_user)
		Passage.delete(@passage)
		# @passages=Passage.all
		flash[:notice]= "删除成功啦"
		redirect_to edit_userinfo_path(current_user.userinfo.id)
		else
		flash[:error]= "阿啦，不是你的帖子不能删除啦！"
		redirect_to edit_userinfo_path(current_user.userinfo.id)
		end
		
	end
	private
	def passage_params
	 params.require(:passage).permit(:title, :content, :id)
	end

end
