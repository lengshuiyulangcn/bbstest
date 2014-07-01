class Comment < ActiveRecord::Base
  attr_accessible :author, :content, :passage_id, :user_id
  belongs_to :user
  belongs_to :passage
  has_many :notifications  
 validates_length_of :content, minimum:2, maximum: 2048, too_short: "should be longer than 10 characters", too_long: "no longer than 2048 characters"
   #validates :content, :length => {:minimum => 10, :maximum => 255, :message=> "input length should be between 10 and 255"}
  #validates :content,:length=>{:minimum=>10, :maximum=>255, :too_short=> "10文字以上入力してください",:too_long=>"255文字を超えないでください"}
after_create :add_money, :send_notifications

def get_author
    Userinfo.find(:first, :conditions=>{:user_id=>self.user_id})
  end
def admin_list
list=[]
list << self.user
list+=self.passage.category.get_admins
end

private
def here_users
    all = []
    Passage.find(self.passage_id).comments.each do |comment|
     all << comment.user_id
    end
    all.uniq
  end

  def send_notifications
    here_users.each do |uid|
      Notification.create(user_id: uid, comment_id: self.id) unless uid == self.user_id
    end
  end

def add_money
    self.user.userinfo.money+=2
    self.user.userinfo.save
  end
end
