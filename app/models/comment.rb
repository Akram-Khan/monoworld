class Comment < ActiveRecord::Base
  attr_accessible :comment, :user

  belongs_to :user
  belongs_to :photo
  
end
