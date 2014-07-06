class UnitsController < ApplicationController
	def index
		@course = Course.find(params[:course_id])
		@units = @course.units
		@units = @course.units.paginate(:page => params[:page], :per_page => 10)
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

	def download
    if url = Unit.find(params[:id]).audio.path
		  send_file url, x_sendfile: true
      redirect_to :back
    else
      flash[:error] = 'Could not complete file download.'
      redirect_to :back
    end
	end
end
