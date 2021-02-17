module ApplicationHelper
	# def login_helper(style) # this is equivalent to line below
	def login_helper style = ''	# default argument
		if current_user.is_a?(GuestUser)
			(link_to "Register", new_user_registration_path, class: style) + 
			" ".html_safe + 
			(link_to "Login", new_user_session_path, class: style )
    	else 
      		link_to "Logout", destroy_user_session_path, method: :delete, class: style
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

  def nav_items
	[
		{
			url: root_path,
			title: "Home"
		},
		{
			url: about_path,
			title: "About"
		},
		{
			url: contact_path,
			title: "Contact"
		},
		{
			url: blogs_path,
			title: "Blog"
		},
		{
			url: portfolios_path,
			title: "Portfolio"
		},
		{
			url: tech_news_path,
			title: "Tech News"
		}
	]
  end

  def nav_helper style, wrap_tag
	nav_links = ''

	nav_items.each do |item|
		nav_links << "<#{wrap_tag}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{wrap_tag}>"
	end

	nav_links.html_safe
  end

  def nav_helper_heredoc style, wrap_tag
	# Heredoc syntax
nav_links = <<NAV
<#{wrap_tag}><a href="#{root_path}" class="#{style} #{active? root_path}">Home</a></#{wrap_tag}>
<#{wrap_tag}><a href="#{about_path}" class="#{style} #{active? about_path}">About</a></#{wrap_tag}>
<#{wrap_tag}><a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact</a></#{wrap_tag}>
<#{wrap_tag}><a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blog</a></#{wrap_tag}>
<#{wrap_tag}><a href="#{portfolios_path}" class="#{style} #{active? portfolios_path}">Portfolio</a></#{wrap_tag}>
NAV

	nav_links.html_safe
  end

  def active? path
	"active" if current_page? path
  end

	def alerts
		alert = (flash[:alert] || flash[:error] || flash[:notice])

		if alert
			alert_generator alert
		end
	end

	def alert_generator msg
		js add_gritter(msg, :title => "Attention!", sticky: false) 
	end
end

# <%= link_to "Home", root_path, class: 'nav-link' %>
# <%= link_to "About", about_path, class: 'nav-link' %>
# <%= link_to "Contact", contact_path, class: 'nav-link' %>
# <%= link_to "Blog", blogs_path, class: 'nav-link' %>
# <%= link_to "Portfolio", portfolios_path, class: 'nav-link' %>