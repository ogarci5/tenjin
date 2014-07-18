class UnitsController < ApplicationController
	def index
		@course = Course.find(params[:course_id])
		@units = @course.units.order('number ASC').paginate(:page => params[:page], :per_page => 10)
	end
	
	def new
		@course = Course.find(params[:course_id])
    auto_increment = @course.units.count
    @unit = @course.units.build(number: auto_increment)
	end
	
	def create
		@course = Course.find(params[:course_id])
		@unit = @course.units.build(params[:unit])
		@unit.save
		redirect_to course_units_path(@course)
	end

	def download
    url = Unit.find(params[:id]).audio.path
    if url
		  send_file url, x_sendfile: true
    else
      flash[:error] = 'Could not complete file download.'
    end
	end
end
