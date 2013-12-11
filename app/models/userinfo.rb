class Userinfo < ActiveRecord::Base
  attr_accessible :image , :user_id , :pr
  mount_uploader :image, ImageUploader
  belongs_to :user
end
