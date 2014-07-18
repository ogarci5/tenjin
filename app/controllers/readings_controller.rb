class ReadingsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @readings = @course.readings.order('number ASC').paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @course = Course.find(params[:course_id])
    auto_increment = @course.readings.count + 1
    @reading = @course.readings.build(number: auto_increment)
  end

  def create
    @course = Course.find(params[:course_id])
    @reading = @course.readings.build(params[:reading])
    @reading.save
    redirect_to course_readings_path(@course)
  end

  def download
    url = Reading.find(params[:id]).audio.path
    if url
      send_file url, x_sendfile: true
    else
      flash[:error] = 'Could not complete file download.'
    end
  end
end
