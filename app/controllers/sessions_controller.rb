class SessionsController < Devise::SessionsController
  skip_before_filter :authenticate_user!

  def new
  end

  def create
    p self.resource
    p auth_options
    p resource_name
    p
    #ObjectSpace.each_object(self.class) {|x| p x }
    super
  end

  def destroy
    super
  end
end
