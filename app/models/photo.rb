class Photo < ActiveRecord::Base

  mount_uploader :picture, PictureUploader
  attr_accessible :name, :picture, :user

  belongs_to :theme
  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates :name, :presence => true

end
