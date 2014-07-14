class SessionsController < ApplicationController
  skip_before_filter :require_login
  def new
  end

  def create
    user = User.find_by_username(params[:session][:username])
    p params
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to root_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
