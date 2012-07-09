class Photo < ActiveRecord::Base

  mount_uploader :picture, PictureUploader
  attr_accessible :name, :picture, :user

  belongs_to :theme
  belongs_to :user

  validates :name, :presence => true

end
