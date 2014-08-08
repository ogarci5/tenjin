class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
    	sign_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    user.save
    p user.errors
    redirect_to :back
  end
end
