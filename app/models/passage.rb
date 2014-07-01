class Passage < ActiveRecord::Base
  attr_accessible :author, :content, :title, :clicked, :category_id
  has_many :comments
  belongs_to :user
  belongs_to :category
  accepts_nested_attributes_for :comments
  validates_length_of :content, minimum:10, maximum: 4096, too_short: "should be longer than 10 characters", too_long: "no longer than 4096 characters"
  validates_length_of :title, minimum:2, maximum: 255, too_short: "should be longer than 2 characters", too_long: "no longer than 255 characters"
  after_create :add_money
  after_initialize :init
  def init
  	self.clicked=0
  end
  def click!
	self.clicked+=1
	self.save
  end
  def get_author
    Userinfo.find(:first, :conditions=>{:user_id=>self.user_id})
  end
  def admin_list
    list=[]
    list << self.user
    list+=self.category.get_admins
  end
 
 private
  def add_money
    self.user.userinfo.money+=5
    self.user.userinfo.save
  end
end
