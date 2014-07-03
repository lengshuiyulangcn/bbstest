class Category < ActiveRecord::Base
  attr_accessible :description, :name, :thumb_image
  def recent_passage
  	Passage.where(:category_id=>self.id).order('created_at DESC').first(3)
  end
  def get_admins
  	Admin.where(:category_id=>self.id).map{|admin| admin.get_user}
  end
end
