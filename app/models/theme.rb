class Theme < ActiveRecord::Base

  attr_accessible :name

  has_many :photos, :dependent => :destroy
  
  validates :name, :presence => true
  #validates :description, :presence => true

end
