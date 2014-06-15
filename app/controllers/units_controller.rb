class UnitsController < ApplicationController
	def index
		@course = Course.find(params[:course_id])
		@units = @course.units
		@units = @course.units.paginate(:page => params[:page], :per_page => 12)
	end
	
	def new
		@course = Course.find(params[:course_id])
		@unit = @course.units.build
	end
	
	def create
		@course = Course.find(params[:course_id])
		@unit = @course.units.build(params[:unit])
		@unit.save
		redirect_to course_units_path(@course)
	end
end
