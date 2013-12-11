class Comment < ActiveRecord::Base
  attr_accessible :author, :content, :passage_id
  belongs_to :user
  belongs_to :passage
   validates_length_of :content, minimum:10, maximum: 2048, too_short: "should be longer than 10 characters", too_long: "no longer than 2048 characters"
   #validates :content, :length => {:minimum => 10, :maximum => 255, :message=> "input length should be between 10 and 255"}
  #validates :content,:length=>{:minimum=>10, :maximum=>255, :too_short=> "10文字以上入力してください",:too_long=>"255文字を超えないでください"}

end
