class Passage < ActiveRecord::Base
  attr_accessible :author, :content, :title
  has_many :comments
  accepts_nested_attributes_for :comments
end
