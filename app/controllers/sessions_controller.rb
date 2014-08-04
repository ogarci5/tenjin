class SessionsController < Devise::SessionsController
  skip_before_filter :authenticate_user!

  def new
  end

  def create
    super
  end

  def destroy
    super
  end
end
