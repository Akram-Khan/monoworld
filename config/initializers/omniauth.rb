Rails.application.config.middleware.use OmniAuth::Builder do
  #require 'openid/store/filesystem' 
  #provider :open_id, OpenID::Store::Filesystem.new("#{Rails.root}/tmp"), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
  
end