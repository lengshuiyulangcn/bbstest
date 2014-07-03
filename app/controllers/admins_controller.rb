class AdminsController < ApplicationController
    def index
    	@admins=Admin.all
	@admin=Admin.new
    end
    def destroy
        if Admin.destroy(params.permit(:id))
	flash[:notice]="删除成功"
	redirect_to admins_path
	else
	flash[:error]="删除失败"
	redirect_to admins_path
	end
    end
    def create
	fake_params=admin_params
	category=Category.where(name: fake_params[:category_id]).first
	user=User.where(username: fake_params[:user_id]).first
	if category==nil or user==nil
	flash[:error]="不存在的用户或者分区号"
	redirect_to admins_path
	return
	end
	if Admin.create(:user_id=>user.id, :category_id=>category.id)
	flash[:notice]="创建管理员成功"
	else
	flash[:error]="创建管理员失败"
	end
	redirect_to admins_path
    end
	private
	def admin_params
	params.require(:admin).permit(:user_id, :category_id)
	end
end
