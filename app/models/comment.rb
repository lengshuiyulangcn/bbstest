class Comment < ActiveRecord::Base
  attr_accessible :author, :content, :passage_id
  belongs_to :passage
end
