class CompaniesController < ApplicationController
	def index
		@companies = Companie.all
	end
end
