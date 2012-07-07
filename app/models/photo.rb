class Photo < ActiveRecord::Base

  mount_uploader :picture, PictureUploader
  attr_accessible :name

end
