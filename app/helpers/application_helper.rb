module ApplicationHelper
	def login_helper
		if current_user.is_a?(GuestUser)
  		(link_to "Register", new_user_registration_path) + 
      "<br>".html_safe + 
      (link_to "Login", new_user_session_path )
    else 
      link_to "Logout", destroy_user_session_path, method: :delete
    end
	end

	def source_helper(layout_name)
		if session[:source]
			greeting = "Thank you for coming to us from #{session[:source]}, your layout is #{layout_name}"
      		content_tag(:p, greeting, class: "source-greeting")
    	end 
	end

  def copyright_generator
    DevcampViewToolFeanor::Renderer.copyright 'Feanor306', 'All rights reserved'
  end

end
