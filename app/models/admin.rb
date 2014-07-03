class Admin < ActiveRecord::Base
  attr_accessible :category_id, :user_id
  validates :category_id, :presence => true
  validates :user_id, :presence => true

def get_user
    User.where(:id=>self.user_id).first
end

end
