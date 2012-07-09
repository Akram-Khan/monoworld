class Theme < ActiveRecord::Base

  attr_accessible :name, :description

  has_many :photos, :dependent => :destroy
  belongs_to :user
  
  validates :name, :presence => true
  validates :description, :presence => true

end
