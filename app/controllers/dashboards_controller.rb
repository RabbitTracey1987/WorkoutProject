class DashboardsController < ApplicationController
	def index
		@atheletes=User.paginate(:page => params[:page])
	end
	def search 
		@atheletes=User.search_by_name(params[:search_name]).paginate(page:params[:page])
	end
end