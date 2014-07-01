class Category < ActiveRecord::Base
  attr_accessible :description, :name, :thumb_image
  def recent_passage
  	Passage.find(:all, :conditions=>["category_id=?", self.id], :order=>'created_at DESC', :limit=>3)
  end
  def get_admins
  	Admin.find(:all, :conditions=>{:category_id=>self.id}).map{|admin| admin.get_user}
  end
end
