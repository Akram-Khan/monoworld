class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname
  # attr_accessible :title, :body

  firstname_regex = /^(([a-z]_)|[a-z])([a-z])*$/i
  lastname_regex = /^(([a-z]_)|[a-z])([a-z]+\s?)*$/i

   validates :firstname,:presence   => true, 
                        :length     => { :within => 1..50},
                        :format     => {:with => firstname_regex, :message => "Only English language letters allowed" }

  validates :lastname,  :presence   => true, 
                        :length     => { :within => 1..30 },
                        :format     => {:with => lastname_regex, :message => "Only English language letters allowed" }
end
