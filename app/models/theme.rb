class Theme < ActiveRecord::Base

  has_many :photos, :dependent => :destroy
  attr_accessible :name
end
