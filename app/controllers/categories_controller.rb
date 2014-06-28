#encoding:utf-8
class CategoriesController < ApplicationController
	before_filter :authenticate_user!
	def index
		@cats=Category.all
		@new_cat=Category.new
	end
	def create
		if current_user.username==ENV["admin"]
		@cat=Category.new
		@cat.name=params[:category][:name]
		@cat.description=params[:category][:description]
		@cat.thumb_image=params[:category][:thumb_image]
		if @cat.save
		redirect_to root_path
		else
		flash[:error]="创建失败"
		render :template=>"category/index"
		end
		else
		flash[:error]="创建失败"
		render :template=>"category/index"
		end
	end
	def show
		@cat=Category.find(params[:id])
		@user=User.find(current_user.id)
		@passages= Passage.where(category_id: params[:id]).paginate(:page => params[:page], :order=>'created_at DESC', :per_page => 10)	
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
end
