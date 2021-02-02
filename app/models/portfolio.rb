class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	# Also a scope
	def self.angular
		where(subtitle: "Angular")
	end

	scope :ruby_on_rails_portfolio, -> { where(subtitle: "Ruby on rails")}

	# Default value field initializer
	after_initialize :set_defaults

	def set_defaults
		# ||= operator sets value only if the field is empty
		self.main_image ||= "https://via.placeholder.com/600x400"
		self.thumb_image ||= "https://via.placeholder.com/350x200"
	end
end
