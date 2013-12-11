class Passage < ActiveRecord::Base
  attr_accessible :author, :content, :title
  has_many :comments
  belongs_to :user
  accepts_nested_attributes_for :comments
  validates_length_of :content, minimum:10, maximum: 4096, too_short: "should be longer than 10 characters", too_long: "no longer than 4096 characters"
  validates_length_of :title, minimum:2, maximum: 255, too_short: "should be longer than 2 characters", too_long: "no longer than 255 characters"

end
