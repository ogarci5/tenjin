class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to login_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    current_user.theme = params[:theme] if params[:theme]
    current_user.save
    render :show
  end
end
