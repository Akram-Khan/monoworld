class Photo < ActiveRecord::Base

  mount_uploader :picture, PictureUploader
  attr_accessible :name

  belongs_to :theme

  validates :name, :presence => true

end
