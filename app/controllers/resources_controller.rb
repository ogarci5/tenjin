class ResourcesController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @resources = @course.resources
    @resources = @course.resources.paginate(:page => params[:page], :per_page => 10)
  end
  def new
    @course = Course.find(params[:course_id])
    @resource = @course.resources.build
  end
  def create
    @course = Course.find(params[:course_id])
    @resource = @course.resources.build(params[:resource])
    @resource.save
    redirect_to course_resources_path(@course)
  end
  def show
    @course = Course.find(params[:course_id])
    @resource = Resource.find(params[:id])
  end
  def edit
    @course = Course.find(params[:course_id])
    @resource = Resource.find(params[:id])
  end
  def update
    @course = Course.find(params[:course_id])
    @resource = Resource.find(params[:id])
    type = @resource.type ? @resource.type.underscore.to_sym : :resource
    @resource.update_attributes(params[type])
    redirect_to course_resource_path(@course, @resource)
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