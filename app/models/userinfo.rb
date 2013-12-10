class Userinfo < ActiveRecord::Base
  attr_accessible :image , :user_id
  mount_uploader :image, ImageUploader
  belongs_to :user
end
