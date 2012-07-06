class SessionsController < Devise::SessionsController  
  	def new
    	resource = build_resource
    	clean_up_passwords(resource)
  	end
end
