class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :provider, :uid
  # attr_accessible :title, :body

  has_many :themes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :photos, :through => :themes

  firstname_regex = /^(([a-z]_)|[a-z])([a-z])*$/i
  lastname_regex = /^(([a-z]_)|[a-z])([a-z]+\s?)*$/i

  validates :firstname,:presence   => true, 
                        :length     => { :within => 1..50},
                        :format     => {:with => firstname_regex, :message => "Only English language letters allowed" }

  validates :lastname,  :presence   => true, 
                        :length     => { :within => 1..30 },
                        :format     => {:with => lastname_regex, :message => "Only English language letters allowed" }


  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    #else # Create a user with a stub password. 
      #User.create!(:email => data.email, :password => Devise.friendly_token[0,20], :firstname => "stub", :lastname => "stub") 
    end
  end

  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.where(:email => data["email"]).first
      user
    else
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end

end


