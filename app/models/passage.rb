class Passage < ActiveRecord::Base
  attr_accessible :author, :content, :title
  has_many :comments
  accepts_nested_attributes_for :comments
  validates_length_of :content, minimum:10, maximum: 255, too_short: "should be longer than 10 characters", too_long: "no longer than 255 characters"
  validates_length_of :title, minimum:10, maximum: 255, too_short: "should be longer than 10 characters", too_long: "no longer than 255 characters"

end
