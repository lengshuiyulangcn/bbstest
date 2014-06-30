class Notification < ActiveRecord::Base
  attr_accessible :comment_id, :unread, :user_id
  belongs_to :comment
  belongs_to :user
after_initialize :init

def init
	self.unread=true
end
end
