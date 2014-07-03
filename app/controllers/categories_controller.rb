#encoding:utf-8
class CategoriesController < ApplicationController
	before_filter :authenticate_user!
	def index
		@cats=Category.all
		@new_cat=Category.new
	end
	def create
		#modify to rails 4.xx
#permit(:description, :thumb_image, :name)
		if current_user.username==ENV["admin"]
		if Category.create(category_params)
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
		@cat=Category.find(params.permit(:id)[:id])
		@user=User.find(current_user.id)
		@passages= Passage.where(category_id: params.permit(:id)[:id]).paginate(:page => params[:page], :per_page => 10).order('created_at DESC')	
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
	private
	def category_params
	    params.require(:category).permit(:category_id, :name, :description, :thumb_image)
	end
end
