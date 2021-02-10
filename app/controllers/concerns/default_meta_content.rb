module DefaultMetaContent
	extend ActiveSupport::Concern

	included do
		before_action :set_meta_defaults
	end

	def set_meta_defaults
		@page_title = "Portfolio | Feanor306"
		@seo_keywords = "George Parsehyan Feanor306"
	end
end

