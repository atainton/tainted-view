class PagesController < ApplicationController
	before_action :authorize_admin!, only: [:admin]

	def home
	end

	def about_me
	end

	def contact_us
	end

	def admin
	end
end
