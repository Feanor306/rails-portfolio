class Skill < ApplicationRecord
	include Placeholder
	validates_presence_of :title, :percent_time

	# Default value field initializer
	after_initialize :set_defaults

	def set_defaults
		# ||= operator sets value only if the field is empty
		self.badge ||= Placeholder.image_generator(height: '250', width: '250')
	end
end
